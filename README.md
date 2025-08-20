# Grafana Alert Rule Management Scripts


This repository contains a set of terraform files designed to automate the management of Grafana alert rules using the Grafana REST API. These files allow you to upload and delete alert rules in bulk from a Grafana-provisioning-format JSON file.

This is particularly useful for migrating alert rules from one environment to another or for managing your Grafana alerts as code (GitOps).

---

## Included Rule Files
The ALL-In-One.tf file contains a set of out-of-the-box OpenShift Container Platform alert rules that have been converted into the Grafana provisioning format through the [import tool](https://grafana.com/docs/grafana/latest/alerting/alerting-rules/alerting-migration/) with the grafana version 12.1.0 . These include:

-   `openshift-dns.rules`
-   `openshift-etcd.rules`
-   `openshift-logging-collector`
-   `openshift-logging-logging-loki-prometheus-rule`
-   `openshift-ovn-kubernetes-master-rules`
-   `openshift-ovn-kubernetes-networking-rules`
-   `openshift-storage-noobaa-prometheus-rules`
-   `openshift-storage-ocs-prometheus-rules`
-   `openshift-storage-prometheus-ceph-rules`

---

## Prerequisites

Before using these scripts, ensure you have the following:

1.  **Command-Line Tools:**
    * **`terraform`**: A tool for automation tasks,with the grafana provider to manage Grafana resources.used to make the API requests. Please check [MacOS](https://developer.hashicorp.com/terraform/install#darwin),[windows](https://developer.hashicorp.com/terraform/install#windows),[Linux](https://developer.hashicorp.com/terraform/install#linux) for how to install it.  
    * **`Linux shell`**: A Linux Bash shell enviroment.

2.  **Grafana API Key:**
    * You need an API key with the **Editor** role for the target Grafana organization. An Editor role is required to create, view, and delete folders and alert rules.
    * To create a key, log in to Grafana and navigate to **Administration > Users and access > API keys** > **+ Add API key**. **Note:** If you are targeting a specific organization, the API key must be created *within* that organization.

---

## Terraform Files

**Main.tf**
* main file to define grafana provider,url,authehntication information.

```terraform
terraform {
    required_providers {
        grafana = {
            source = "grafana/grafana"
            version = ">= 2.9.0"
        }
    }
}

provider "grafana" {
    url = <grafana-url>
    auth = <api-key>
}
```

**datasources.tf**
* datasource.tf file to define grafana datasource name that imported alert rules used for query and the grafana folder which hold the imported alert rules.

```terraform
data "grafana_data_source" "my_target_data_source" {
    name = "prometheus-C4E"
}

resource "grafana_folder" "RHOCP_OPS_EXTRA" {
    title = "RHOCP_OPS_EXTRA"
}
```

---
**ALL-In-One.tf**
* ALL-In-One.tf contains a set of out-of-the-box OpenShift Container Platform alert rules that have been converted into the Grafana provisioning format through the [import tool](https://grafana.com/docs/grafana/latest/alerting/alerting-rules/alerting-migration/) with the grafana version 12.1.0

```terraform
resource "grafana_rule_group" "bucket-state-alert-rules" {
  disable_provenance = true
  name             = "bucket-state-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "NooBaaBucketErrorState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }
... ommited ...
```

** By default, you cannot edit resources provisioned via Terraform in Grafana. This ensures that your alerting stack always stays in sync with your Terraform code.
To make provisioned resources editable in the Grafana UI, enable the disable_provenance attribute on alerting resources. **


---

## How to Use the Scripts

### Clone repository 

```bash
git clone https://github.com/pacopeng/ConvertAlertRulesToGrafana.git
```

### Initialze the working direcotry
```bash
terraform init
```
This command initializes the Terraform directory, installing the Grafana Terraform provider configured in the main.tf file.

### provision the resources

```bash
terraform apply
```
Before applying any changes to Grafana, Terraform displays the execution plan and requests your approval.
```bash
 Plan: 4 to add, 0 to change, 0 to destroy.

 Do you want to perform these actions?
 Terraform will perform the actions described above.
 Only 'yes' will be accepted to approve.

 Enter a value:
```
Once you have confirmed to proceed with the changes, Terraform will create the provisioned resources in Grafana!

```bash
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
```

###  unprovision the resources

This script is used for destroy the resources that provisioned by previsous steps. use this if you need to adjust the alert rules.

```bash
terraform destroy
```

Delete all rules defined in ALL-In-One.tf file and confirm with your answer.

```bash
Plan: 0 to add, 0 to change, 28 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
```
