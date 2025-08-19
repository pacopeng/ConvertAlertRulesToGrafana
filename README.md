# Grafana Alert Rule Management Scripts

This repository contains a set of shell scripts designed to automate the management of Grafana alert rules using the Grafana REST API. These scripts allow you to upload and delete alert rules in bulk from a Grafana-provisioning-format JSON file.

This is particularly useful for migrating alert rules from one environment to another or for managing your Grafana alerts as code (GitOps).

---

## Included Rule Files
The `grafana_provisioning_rules/` directory contains a set of out-of-the-box OpenShift Container Platform alert rules that have been converted into the Grafana provisioning format. These include:

-   `openshift-dns.rules.json`
-   `openshift-etcd.rules.json`
-   `openshift-logging-collector.json`
-   `openshift-logging-logging-loki-prometheus-rule.json`
-   `openshift-ovn-kubernetes-master-rules.json`
-   `openshift-ovn-kubernetes-networking-rules.json`
-   `openshift-storage-noobaa-prometheus-rules.json`
-   `openshift-storage-ocs-prometheus-rules.json`
-   `openshift-storage-prometheus-ceph-rules.json`

Note: Within the json file, each alert rules has a unique identifier.(UUID), the upload and delete scripts use this identifier to identify the rules in Grafana. If you want to upload the same json file for different orginization, you need to change the identifier in the json file.
---

## Prerequisites

Before using these scripts, ensure you have the following:

1.  **Command-Line Tools:**
    * **`curl`**: A tool for transferring data with URLs, used to make the API requests.
    * **`jq`**: A lightweight and powerful command-line JSON processor.
        * **macOS:** `brew install jq`
        * **Linux (Debian/Ubuntu):** `sudo apt-get install jq`
        * **Linux (RHEL/CentOS):** `sudo yum install jq`

2.  **Grafana API Key:**
    * You need an API key with the **Editor** role for the target Grafana organization. An Editor role is required to create, view, and delete folders and alert rules.
    * To create a key, log in to Grafana and navigate to **Administration > Users and access > API keys** > **+ Add API key**. **Note:** If you are targeting a specific organization, the API key must be created *within* that organization.

---

## How to Use the Scripts

### 📜 `upload-grafana-rules.sh`

This script reads a Grafana-provisioning-format JSON file, finds or creates the specified folders in Grafana, and uploads each rule individually.

#### **Usage**

Make the script executable and run it with the required arguments.

```bash
chmod +x upload-grafana-rules.sh
./upload-grafana-rules.sh <GRAFANA_URL> <GRAFANA_API_KEY> <PATH_TO_RULES_FILE.json>
```

**Arguments:**
* **`GRAFANA_URL`**: The base URL of your Grafana instance (e.g., `https://grafana.example.com`).
* **`GRAFANA_API_KEY`**: The API key you generated with the Editor role.
* **`PATH_TO_RULES_FILE.json`**: The path to the JSON file containing the alert rules.
* **`DATASOURCE_UID`**: The UID of the datasource where the rules should be uploaded.

### Examples
**Upload to the default organization:**

```bash
./upload-grafana-rules.sh [https://my-grafana.com](https://my-grafana.com) glsa_xxxxxxxxxx \
grafana_provisioning_rules/openshift-dns.rules.json  ceuoby3nl4qgwc
```

### 📜 `delete-grafana-rules.sh`

This script reads the same JSON file, extracts the Unique ID (uid) of every rule, and sends a DELETE request to Grafana for each one.

#### **Usage**
Make the script executable and run it with the same arguments you would use for uploading.

```bash
chmod +x delete-grafana-rules.sh
./delete-grafana-rules.sh <GRAFANA_URL> <GRAFANA_API_KEY> <PATH_TO_RULES_FILE.json>
```

### Example
**Delete all rules defined in the openshift-dns.rules.json file**

```Bash
./delete-grafana-rules.sh https://my-grafana.com glsa_xxxxxxxxxx \
grafana_provisioning_rules/openshift-dns.rules.json
```