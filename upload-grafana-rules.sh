#!/bin/bash

# ==============================================================================
# Grafana Alert Rules - Upload Script (v5)
#
# Description:
# This script intelligently uploads Prometheus-style alert rule groups from a
# JSON file to a Grafana instance. It handles files containing multiple folders,
# where each top-level key in the JSON is treated as a folder name. It
# creates folders if they don't exist and then creates or updates the rule
# groups within the appropriate folder.
#
# Dependencies:
# - 'jq': This script requires jq to parse and manipulate JSON data.
#   Install on Debian/Ubuntu: sudo apt-get install jq
#   Install on macOS (Homebrew): brew install jq
#
# Usage:
# 1. Save this script as 'upload_rules.sh'.
# 2. Make it executable: chmod +x upload_rules.sh
# 3. Run the script with the required arguments:
#    ./upload_rules.sh <grafana_url> <api_token> <json_file>
#
# Example:
#    ./upload_rules.sh http://localhost:3000 YOUR_API_TOKEN grafana_rules.json
#
# ==============================================================================

# --- Function to display usage information ---
usage() {
    echo "Usage: $0 <grafana_url> <api_token> <json_file>"
    echo
    echo "Arguments:"
    echo "  grafana_url     URL of your Grafana instance (e.g., http://localhost:3000)"
    echo "  api_token       Your Grafana API Token with Admin or Editor permissions"
    echo "  json_file       Path to the JSON file with the alert rules to upload"
    exit 1
}

# --- Argument and Dependency Validation ---
if [ "$#" -ne 3 ]; then
    echo "Error: Incorrect number of arguments provided."
    usage
fi

if ! command -v jq &> /dev/null; then
    echo "Error: 'jq' is not installed, but it's required for this script."
    echo "Please install jq to continue."
    exit 1
fi

# --- Assign Command-Line Arguments to Variables ---
GRAFANA_URL="$1"
API_TOKEN="$2"
JSON_FILE="$3"

# --- Main Script Logic ---

# Check if the JSON file exists
if [ ! -f "$JSON_FILE" ]; then
    echo "Error: JSON file not found at '$JSON_FILE'"
    exit 1
fi

echo "Step 1: Parsing all folder names from '$JSON_FILE'..."

# Get all top-level keys from the JSON, which represent the folder names.
FOLDER_NAMES=$(jq -r 'keys[]' "$JSON_FILE")
if [ -z "$FOLDER_NAMES" ]; then
    echo "Error: Could not find any folder definitions (top-level keys) in the JSON file."
    exit 1
fi

# --- Loop through each folder defined in the JSON file ---
for FOLDER_NAME in $FOLDER_NAMES; do
    echo "=================================================="
    echo "Processing folder: '${FOLDER_NAME}'"
    echo "=================================================="

    echo "Step 2: Checking for Grafana folder..."

    # Search for the folder by title to get its UID
    FOLDER_UID=$(curl -s -H "Authorization: Bearer ${API_TOKEN}" "${GRAFANA_URL}/api/folders" | jq -r --arg FOLDER_NAME "${FOLDER_NAME}" '.[] | select(.title == $FOLDER_NAME) | .uid')

    # If FOLDER_UID is empty, the folder doesn't exist, so create it
    if [ -z "$FOLDER_UID" ]; then
        echo "Folder not found. Creating it..."
        CREATE_RESPONSE=$(curl -s -X POST -H "Authorization: Bearer ${API_TOKEN}" -H "Content-Type: application/json" -d "{\"title\":\"${FOLDER_NAME}\"}" "${GRAFANA_URL}/api/folders")
        
        # Check for errors during folder creation
        if echo "${CREATE_RESPONSE}" | jq -e '.uid' > /dev/null; then
            FOLDER_UID=$(echo "${CREATE_RESPONSE}" | jq -r '.uid')
            echo "Successfully created folder '${FOLDER_NAME}' with UID: ${FOLDER_UID}"
        else
            echo "Error: Failed to create folder '${FOLDER_NAME}'."
            echo "Grafana API response: ${CREATE_RESPONSE}"
            continue # Skip to the next folder
        fi
    else
        echo "Found existing folder with UID: ${FOLDER_UID}"
    fi

    echo "Step 3: Processing and uploading rule groups for this folder..."

    # Extract the array of rule groups for the current folder.
    # The structure is {"folder_name": [[{"group1"}, {"group2"}]]}
    # .[$FOLDER_NAME][0] selects the inner array of groups.
    # The ' // []' provides a fallback to an empty array if the key is missing or null.
    GROUPS_ARRAY_JSON=$(jq -c --arg FOLDER_NAME "$FOLDER_NAME" '.[$FOLDER_NAME][0] // []' "$JSON_FILE")

    # Check if any rule groups were found for this folder
    if [ -z "$GROUPS_ARRAY_JSON" ] || [ "$GROUPS_ARRAY_JSON" == "[]" ]; then
        echo "Warning: No rule groups found to upload in folder '$FOLDER_NAME'."
        continue # Skip to the next folder
    fi

    # Loop through each rule group object in the array
    echo "$GROUPS_ARRAY_JSON" | jq -c '.[]' | while IFS= read -r group_json; do
        GROUP_NAME=$(echo "$group_json" | jq -r '.name')
        INTERVAL=$(echo "$group_json" | jq -r '.interval')

        echo "--------------------------------------------------"
        echo "Preparing rule group: '${GROUP_NAME}'..."

        # Transform the rules within this group to the format Grafana API expects
        TRANSFORMED_RULES=$(echo "$group_json" | jq -c '[ .rules[] | .grafana_alert + { annotations: .annotations, labels: .labels, for: .for } ]')

        # Construct the final payload for the API
        PAYLOAD=$(jq -n --arg name "$GROUP_NAME" --arg interval "$INTERVAL" --argjson rules "$TRANSFORMED_RULES" \
            '{name: $name, interval: $interval, rules: $rules}')

        # API endpoint for creating/updating a rule group within a folder
        API_ENDPOINT="${GRAFANA_URL}/api/v1/provisioning/folders/${FOLDER_UID}/rule-groups/${GROUP_NAME}"

        echo "Uploading rule group '${GROUP_NAME}' to folder '${FOLDER_NAME}'..."
        RESPONSE=$(curl -s -w "\n%{http_code}" -X PUT \
             -H "Authorization: Bearer ${API_TOKEN}" \
             -H "Content-Type: application/json" \
             --data "$PAYLOAD" \
             "${API_ENDPOINT}")

        # Extract the response body and HTTP status code
        HTTP_CODE=$(tail -n1 <<< "$RESPONSE")
        RESPONSE_BODY=$(sed '$ d' <<< "$RESPONSE")

        if [ "$HTTP_CODE" -eq 202 ] || [ "$HTTP_CODE" -eq 201 ]; then
            echo "SUCCESS: Rule group '${GROUP_NAME}' uploaded successfully (HTTP ${HTTP_CODE})."
        else
            echo "ERROR: Failed to upload rule group '${GROUP_NAME}' (HTTP ${HTTP_CODE})."
            echo "Response Body: ${RESPONSE_BODY}"
        fi
    done
done

echo "=================================================="
echo "Upload process finished for all folders."

