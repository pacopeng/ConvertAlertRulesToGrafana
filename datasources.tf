data "grafana_data_source" "my_target_data_source" {
    name = "prometheus-C4E"
}



#resource "grafana_folder" "openshift-dns-operator-dns" {
#    title = "openshift-dns-operator-dns"
#}
#
#resource "grafana_folder" "openshift-etcd-operator-etcd-prometheus-rules" {
#    title = "openshift-etcd-operator-etcd-prometheus-rules"
#}
#
#resource "grafana_folder" "openshift-logging-collector" {
#    title = "openshift-logging-collector"
#}
#
#resource "grafana_folder" "openshift-logging-logging-loki-prometheus-rule" {
#    title = "openshift-logging-logging-loki-prometheus-rule"
#}

resource "grafana_folder" "RHOCP_OPS_EXTRA" {
    title = "RHOCP_OPS_EXTRA"
}

