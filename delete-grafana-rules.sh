#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

# --- Script Configuration ---
GRAFANA_URL="$1"
GRAFANA_API_KEY="$2"
RULES_FILE="$3"

# --- Usage Instructions ---
if [[ $# -ne 3 ]]; then
  echo "This script deletes Grafana alert rules and their parent folder using a JSON file as a reference."
  echo ""
  echo "Usage: $0 <GRAFANA_URL> <GRAFANA_API_KEY> <PATH_TO_RULES_FILE.json>"
  echo "Example: $0 https://my-grafana.com glsa_xxxxxxxxxxxx my-rules.json"
  exit 1
fi

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

# --- Main Logic ---

# Get the total number of rule groups defined in the file
num_groups=$(jq '.groups | length' "$RULES_FILE")
echo "Found $num_groups group(s) to process for deletion."

# Loop through each group in the JSON file
for (( i=0; i<$num_groups; i++ )); do
  group_json=$(jq ".groups[$i]" "$RULES_FILE")
  
  # --- Sanitize Folder Name ---
  folder_name_raw=$(echo "$group_json" | jq -r '.folder')
  folder_name=$(echo "$folder_name_raw" | xargs) # Trim whitespace
  
  # --- 1. Delete Alert Rules in the Group ---
  rule_uids=$(echo "$group_json" | jq -r '.rules[].uid')
  
  echo "--------------------------------------------------"
  echo "Processing folder: '$folder_name'"

  if [[ -z "$rule_uids" ]]; then
    echo "  -> No rule UIDs found in this group. Skipping rule deletion."
  else
    echo "  -> Deleting rules..."
    while IFS= read -r uid; do
      api_endpoint="$GRAFANA_URL/api/v1/provisioning/alert-rules/$uid"
      response_code=$(curl -s -w "%{http_code}" -X DELETE \
        -H "Authorization: Bearer $GRAFANA_API_KEY" \
        "$api_endpoint" -o /dev/null)

      if [[ "$response_code" -ge 200 && "$response_code" -lt 300 ]]; then
        echo "    - SUCCESS: Deleted rule UID $uid (HTTP $response_code)."
      elif [[ "$response_code" == "404" ]]; then
        echo "    - INFO: Rule UID $uid not found (HTTP $response_code)."
      else
        echo "    - ERROR: Failed to delete rule UID $uid (HTTP $response_code)."
      fi
    done <<< "$rule_uids"
  fi

  # --- 2. Delete the Folder ---
  echo "  -> Attempting to delete folder '$folder_name'..."
  folder_list_json=$(curl -s -H "Authorization: Bearer $GRAFANA_API_KEY" "$GRAFANA_URL/api/folders")
  folder_uid=$(echo "$folder_list_json" | jq -r ".[] | select(.title == \"$folder_name\") | .uid")

  if [[ -z "$folder_uid" ]]; then
    echo "    - INFO: Folder not found, nothing to delete."
  else
    api_endpoint="$GRAFANA_URL/api/folders/$folder_uid"
    # Capture response body to check for errors
    response_body=$(curl -s -w "\n%{http_code}" -X DELETE \
      -H "Authorization: Bearer $GRAFANA_API_KEY" \
      "$api_endpoint")
    
    # Extract code and body
    response_code=$(echo "$response_body" | tail -n1)
    body=$(echo "$response_body" | sed '$d')

    if [[ "$response_code" -ge 200 && "$response_code" -lt 300 ]]; then
      echo "    - SUCCESS: Folder deleted successfully (HTTP $response_code)."
    elif [[ "$body" == *"folder cannot be deleted because it's not empty"* ]]; then
      echo "    - INFO: Folder not deleted because it still contains other items (e.g., dashboards or other alert rules)."
    else
      echo "    - ERROR: Failed to delete folder (HTTP $response_code)."
      echo "      Response: $body"
    fi
  fi
done

echo "--------------------------------------------------"
echo "Script finished."