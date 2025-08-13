Shell scripts that will take your Grafana provisioning-format JSON file and upload the rules to your Grafana instance using its REST API. Make sure your Grafana alert rules are saved in a JSON file (e.g., my-rules.json).

The  grafana_provisioning_rules folder contains the OpenShift out-of-box alert rules 

grafana_provisioning_rules/openshift-dns.rules.json
grafana_provisioning_rules/openshift-etcd.rules.json
grafana_provisioning_rules/openshift-logging-collector.json
grafana_provisioning_rules/openshift-logging-logging-loki-prometheus-rule.json
grafana_provisioning_rules/openshift-ovn-kubernetes-master-rules.json
grafana_provisioning_rules/openshift-ovn-kubernetes-networking-rules.json
grafana_provisioning_rules/openshift-storage-noobaa-prometheus-rules.json
grafana_provisioning_rules/openshift-storage-ocs-prometheus-rules.json
grafana_provisioning_rules/openshift-storage-prometheus-ceph-rules.json

This script automates the process by reading your JSON file, finding or creating the correct folders in Grafana, and then uploading each rule group to its designated folder.

The Scripts requires curl for making the API requests and jq for parsing the JSON file. jq is a standard, lightweight command-line JSON processor.


How to Use the Script
Get an API Key: In your Grafana UI, go to Administration > Users and access > API keys and create a key with at least the Editor role. Copy the key.(the user needs to be able to create alert rules  in Grafana, i.e edit role of a organization in grafana)

Make the Script Executable:

Bash

chmod +x upload-grafana-rules.sh
Run the Command: Execute the script from your terminal, providing your Grafana URL, the API key, and the path to your JSON file.

Bash

./upload-grafana-rules.sh http://your-grafana.com <YOUR_API_KEY> my-rules.json
The script will then connect to your Grafana instance, create the necessary folders, and upload each rule group from your file.



How to Use the Deletion Script
Get an API Key: Ensure you have a Grafana API key with the Editor role.

Make the Script Executable:

Bash

chmod +x delete-grafana-rules.sh
Run the Command: Execute the script, providing your Grafana URL, the API key, and the same JSON file you used for the upload.

Bash

./delete-grafana-rules.sh http://your-grafana.com <YOUR_API_KEY> my-rules.json
The script will then delete every rule that is defined in your JSON file.