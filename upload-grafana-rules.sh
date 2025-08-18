#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

# --- Script Configuration ---
GRAFANA_URL="$1"
GRAFANA_API_KEY="$2"
RULES_FILE="$3"
DATASOURCE_UID="$4"
PLACEHOLDER="REPLACE_ME_WITH_YOUR_DATASOURCE"

# --- Usage Instructions ---
if [[ $# -ne 4 ]]; then
  echo "This script uploads Grafana alert rules from a provisioning JSON file using the REST API."
  echo "It temporarily replaces a datasource placeholder in the file before uploading."
  echo ""
  echo "Usage: $0 <GRAFANA_URL> <GRAFANA_API_KEY> <PATH_TO_RULES_FILE.json> <DATASOURCE_UID>"
  echo "Example: $0 https://my-grafana.com glsa_xxxxxxxxxxxx my-rules.json ds_uid_goes_here"
  exit 1
fi

# --- File Templating & Cleanup ---
# This function reverts the file to its original state.
# Thanks to 'set -e', this part of the script will only be reached if all preceding commands succeed.
cleanup() {
  echo "--------------------------------------------------"
  echo "✅ Script finished successfully. Rolling back changes to $RULES_FILE..."
  # Use -i '' for macOS compatibility. For Linux, you can just use -i.
  sed -i '' "s/$DATASOURCE_UID/$PLACEHOLDER/g" "$RULES_FILE"
  echo "Rollback complete."
}
# Register the cleanup function to be called on successful script exit.
trap cleanup EXIT

# --- Sanitize URL ---
# Add https:// if no scheme is present
if ! [[ "$GRAFANA_URL" =~ ^https?:// ]]; then
  echo "-> No http/https scheme found in URL. Prepending https://."
  GRAFANA_URL="https://$GRAFANA_URL"
fi
# Remove any trailing slashes from the URL for robustness
GRAFANA_URL="${GRAFANA_URL%/}"

# --- Dependency Check ---
if ! command -v jq &> /dev/null; then
  echo "Error: jq is not installed. Please install it to continue (e.g., 'brew install jq')."
  exit 1
fi
if ! command -v curl &> /dev/null; then
  echo "Error: curl is not installed. Please install it to continue."
  exit 1
fi

echo "Processing file: $RULES_FILE"

# --- Temporary Datasource Replacement ---
echo "-> Temporarily replacing placeholder '$PLACEHOLDER' with datasource UID '$DATASOURCE_UID'..."
# Use -i '' for macOS compatibility. For Linux, you can just use -i.
sed -i '' "s/$PLACEHOLDER/$DATASOURCE_UID/g" "$RULES_FILE"
echo "Replacement complete."


# --- Main Logic ---

# Read the entire JSON file content
rules_json=$(cat "$RULES_FILE")

# Get the total number of rule groups defined in the file
num_groups=$(echo "$rules_json" | jq '.groups | length')
echo "Found $num_groups rule group(s) to process."

# Loop through each group in the JSON file
for (( i=0; i<$num_groups; i++ )); do
  # Extract the current group's data using jq
  group_json=$(echo "$rules_json" | jq ".groups[$i]")
  folder_name=$(echo "$group_json" | jq -r '.folder')
  group_name=$(echo "$group_json" | jq -r '.name')

  echo "--------------------------------------------------"
  echo "Processing Group: '$group_name' -> Folder: '$folder_name'"

  # --- Step 1: Find or Create the Target Folder ---
  echo "  -> Fetching folder list from Grafana..."
  folder_list_json=$(curl -s -H "Authorization: Bearer $GRAFANA_API_KEY" "$GRAFANA_URL/api/folders")

  # Validate the JSON response from the API
  if ! echo "$folder_list_json" | jq empty 2>/dev/null; then
      echo "  -> ERROR: Received invalid JSON from Grafana's /api/folders endpoint."
      echo "     This is often caused by an incorrect URL or a reverse proxy issue."
      echo "--- API Response ---"
      echo "$folder_list_json"
      echo "--------------------"
      exit 1
  fi

  # Search for the folder by its title to get its UID
  folder_uid=$(echo "$folder_list_json" | jq -r ".[] | select(.title == \"$folder_name\") | .uid")

  if [[ -z "$folder_uid" ]]; then
    echo "  -> Folder '$folder_name' not found. Creating it..."
    # If the folder doesn't exist, create it and capture the new UID
    response=$(curl -s -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $GRAFANA_API_KEY" \
      -d "{\"title\": \"$folder_name\"}" \
      "$GRAFANA_URL/api/folders")
    
    folder_uid=$(echo "$response" | jq -r '.uid')

    if [[ -z "$folder_uid" || "$folder_uid" == "null" ]]; then
        echo "  -> ERROR: Failed to create folder '$folder_name'. Aborting."
        echo "  -> API Response: $response"
        exit 1
    fi
    echo "  -> Created folder with UID: $folder_uid"
  else
    echo "  -> Found existing folder with UID: $folder_uid"
  fi

  # --- Step 2: Prepare the Payload for each Rule ---
  num_rules=$(echo "$group_json" | jq '.rules | length')
  echo "  -> Found $num_rules rule(s) in group '$group_name'."

  for (( j=0; j<$num_rules; j++ )); do
    rule_json=$(echo "$group_json" | jq ".rules[$j]")
    rule_title=$(echo "$rule_json" | jq -r '.title')

    # Add the folder UID and group name to the rule's JSON payload
    api_payload=$(echo "$rule_json" | jq --arg folder_uid "$folder_uid" --arg group_name "$group_name" \
      '. + {folderUid: $folder_uid, group: $group_name}')

    # --- Step 3: Upload the individual Rule ---
    echo "    -> Uploading rule '$rule_title'..."
    api_endpoint="$GRAFANA_URL/api/v1/provisioning/alert-rules"

    # Make the POST request to create or update the alert rule
    response_code=$(curl -s -w "%{http_code}" -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $GRAFANA_API_KEY" \
      -d "$api_payload" \
      "$api_endpoint" -o /dev/null)

    if [[ "$response_code" -ge 200 && "$response_code" -lt 300 ]]; then
      echo "    -> SUCCESS: Rule '$rule_title' uploaded successfully (HTTP $response_code)."
    else
      echo "    -> ERROR: Failed to upload rule '$rule_title' (HTTP $response_code)."
      # To see the full error from Grafana, you can re-run the curl without '-o /dev/null'
      exit 1 # Exit on failure
    fi
  done
done

# The 'trap cleanup EXIT' at the top of the script will handle the final messages and rollback.