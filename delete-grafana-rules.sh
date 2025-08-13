#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

# --- Script Configuration ---
GRAFANA_URL="$1"
GRAFANA_API_KEY="$2"
RULES_FILE="$3"

# --- Usage Instructions ---
if [[ $# -ne 3 ]]; then
  echo "This script deletes Grafana alert rules using a provisioning JSON file as a reference."
  echo ""
  echo "Usage: $0 <GRAFANA_URL> <GRAFANA_API_KEY> <PATH_TO_RULES_FILE.json>"
  echo "Example: $0 http://localhost:3000 glsa_xxxxxxxxxxxxxxxxxxxx my-rules.json"
  exit 1
fi

# --- Sanitize URL ---
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

# Use jq to extract all rule UIDs from all groups in the file into a flat list
rule_uids=$(jq -r '.groups[].rules[].uid' "$RULES_FILE")

if [[ -z "$rule_uids" ]]; then
  echo "No rule UIDs found in the file. Nothing to do."
  exit 0
fi

echo "Found the following rule UIDs to delete:"
echo "$rule_uids"
echo "--------------------------------------------------"

# Loop through each UID and send a DELETE request
while IFS= read -r uid; do
  echo "  -> Deleting rule with UID: $uid"
  
  # The API endpoint for deleting a single alert rule by its UID
  api_endpoint="$GRAFANA_URL/api/v1/provisioning/alert-rules/$uid"

  # Make the DELETE request
  response_code=$(curl -s -w "%{http_code}" -X DELETE \
    -H "Authorization: Bearer $GRAFANA_API_KEY" \
    "$api_endpoint" -o /dev/null)

  if [[ "$response_code" -ge 200 && "$response_code" -lt 300 ]]; then
    echo "  -> SUCCESS: Rule deleted successfully (HTTP $response_code)."
  elif [[ "$response_code" == "404" ]]; then
     echo "  -> INFO: Rule not found, it may have already been deleted (HTTP $response_code)."
  else
    echo "  -> ERROR: Failed to delete rule (HTTP $response_code)."
  fi
done <<< "$rule_uids"

echo "--------------------------------------------------"
echo "Script finished."
