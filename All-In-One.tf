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

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_bucket_status{bucket_name=~\\\".*\\\"} == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa bucket {{ $labels.bucket_name }} is in error state for more than 5m"
      message        = "A NooBaa Bucket Is In Error State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaNamespaceBucketErrorState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_namespace_bucket_status{bucket_name=~\\\".*\\\"} == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa namespace bucket {{ $labels.bucket_name }} is in error state for more than 5m"
      message        = "A NooBaa Namespace Bucket Is In Error State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaBucketReachingQuotaState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_bucket_quota{bucket_name=~\\\".*\\\"} > 80\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa bucket {{ $labels.bucket_name }} is using {{ printf \"%0.0f\" $value }}% of its quota"
      message        = "A NooBaa Bucket Is In Reaching Quota State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaBucketExceedingQuotaState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_bucket_quota{bucket_name=~\\\".*\\\"} >= 100\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa bucket {{ $labels.bucket_name }} is exceeding its quota - {{ printf \"%0.0f\" $value }}% used"
      message        = "A NooBaa Bucket Is In Exceeding Quota State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaBucketLowCapacityState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_bucket_capacity{bucket_name=~\\\".*\\\"} > 80\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa bucket {{ $labels.bucket_name }} is using {{ printf \"%0.0f\" $value }}% of its capacity"
      message        = "A NooBaa Bucket Is In Low Capacity State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaBucketNoCapacityState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_bucket_capacity{bucket_name=~\\\".*\\\"} > 95\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa bucket {{ $labels.bucket_name }} is using all of its capacity"
      message        = "A NooBaa Bucket Is In No Capacity State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "resource-state-alert-rules" {
  disable_provenance = true
  name             = "resource-state-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "NooBaaResourceErrorState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_resource_status{resource_name=~\\\".*\\\"} == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa resource {{ $labels.resource_name }} is in error state for more than 5m"
      message        = "A NooBaa Resource Is In Error State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaNamespaceResourceErrorState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_namespace_resource_status{namespace_resource_name=~\\\".*\\\"} == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa namespace resource {{ $labels.namespace_resource_name }} is in error state for more than 5m"
      message        = "A NooBaa Namespace Resource Is In Error State"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "system-capacity-alert-rules" {
  disable_provenance = true
  name             = "system-capacity-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "NooBaaSystemCapacityWarning85"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_system_capacity > 85\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa system is approaching its capacity, usage is more than 85%"
      message        = "A NooBaa System Is Approaching Its Capacity"
      severity_level = "warning"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaSystemCapacityWarning95"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_system_capacity > 95\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa system is approaching its capacity, usage is more than 95%"
      message        = "A NooBaa System Is Approaching Its Capacity"
      severity_level = "critical"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NooBaaSystemCapacityWarning100"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"NooBaa_system_capacity == 100\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "A NooBaa system approached its capacity, usage is at 100%"
      message        = "A NooBaa System Approached Its Capacity"
      severity_level = "critical"
      storage_type   = "NooBaa"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "etcd" {
  disable_provenance = true
  name             = "etcd"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "etcdMembersDown"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"max without (endpoint) (\\n  sum without (instance) (up{job=~\\\".*etcd.*\\\"} == bool 0)\\nor\\n  count without (To) (\\n    sum without (instance) (rate(etcd_network_peer_sent_failures_total{job=~\\\".*etcd.*\\\"}[120s])) > 0.01\\n  )\\n)\\n> 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": members are down ({{ $value }})."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-etcd-operator/etcdMembersDown.md"
      summary     = "etcd cluster members are down."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdNoLeader"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"etcd_server_has_leader{job=~\\\".*etcd.*\\\"} == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": member {{ $labels.instance }} has no leader."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-etcd-operator/etcdNoLeader.md"
      summary     = "etcd cluster has no leader."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdMemberCommunicationSlow"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99, rate(etcd_network_peer_round_trip_time_seconds_bucket{job=~\\\".*etcd.*\\\"}[5m]))\\n> 0.15\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": member communication with {{ $labels.To }} is taking {{ $value }}s on etcd instance {{ $labels.instance }}."
      summary     = "etcd cluster member communication is slow."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdHighNumberOfFailedProposals"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"rate(etcd_server_proposals_failed_total{job=~\\\".*etcd.*\\\"}[15m]) > 5\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": {{ $value }} proposal failures within the last 30 minutes on etcd instance {{ $labels.instance }}."
      summary     = "etcd cluster has high number of proposal failures."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdHighFsyncDurations-warning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99, rate(etcd_disk_wal_fsync_duration_seconds_bucket{job=~\\\".*etcd.*\\\"}[5m]))\\n> 0.5\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": 99th percentile fsync durations are {{ $value }}s on etcd instance {{ $labels.instance }}."
      summary     = "etcd cluster 99th percentile fsync durations are too high."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdHighFsyncDurations"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99, rate(etcd_disk_wal_fsync_duration_seconds_bucket{job=~\\\".*etcd.*\\\"}[5m]))\\n> 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": 99th percentile fsync durations are {{ $value }}s on etcd instance {{ $labels.instance }}."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-etcd-operator/etcdHighFsyncDurations.md"
      summary     = "etcd cluster 99th percentile fsync durations are too high."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdHighCommitDurations"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99, rate(etcd_disk_backend_commit_duration_seconds_bucket{job=~\\\".*etcd.*\\\"}[5m]))\\n> 0.25\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": 99th percentile commit durations {{ $value }}s on etcd instance {{ $labels.instance }}."
      summary     = "etcd cluster 99th percentile commit durations are too high."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdDatabaseQuotaLowSpace"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(last_over_time(etcd_mvcc_db_total_size_in_bytes[5m]) / last_over_time(etcd_server_quota_backend_bytes[5m]))*100 > 95\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": database size exceeds the defined quota on etcd instance {{ $labels.instance }}, please defrag or increase the quota as the writes to etcd will be disabled when it is full."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-etcd-operator/etcdDatabaseQuotaLowSpace.md"
      summary     = "etcd cluster database is running full."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdExcessiveDatabaseGrowth"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"predict_linear(etcd_mvcc_db_total_size_in_bytes[4h], 4*60*60) > etcd_server_quota_backend_bytes\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": Predicting running out of disk space in the next four hours, based on write observations within the past four hours on etcd instance {{ $labels.instance }}, please check as it might be disruptive."
      summary     = "etcd cluster database growing very fast."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdDatabaseHighFragmentationRatio"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(last_over_time(etcd_mvcc_db_total_size_in_use_in_bytes[5m]) / last_over_time(etcd_mvcc_db_total_size_in_bytes[5m])) < 0.5 and etcd_mvcc_db_total_size_in_use_in_bytes > 104857600\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": database size in use on instance {{ $labels.instance }} is {{ $value | humanizePercentage }} of the actual allocated disk space, please run defragmentation (e.g. etcdctl defrag) to retrieve the unused fragmented disk space."
      runbook_url = "https://etcd.io/docs/v3.5/op-guide/maintenance/#defragmentation"
      summary     = "etcd database size in use is less than 50% of the actual allocated storage."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "openshift-etcd-rules" {
  disable_provenance = true
  name             = "openshift-etcd.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "etcdGRPCRequestsSlow"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99, sum(rate(grpc_server_handling_seconds_bucket{job=\\\"etcd\\\", grpc_method!=\\\"Defragment\\\", grpc_type=\\\"unary\\\"}[10m])) without(grpc_type))\\n> 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "30m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": 99th percentile of gRPC requests is {{ $value }}s on etcd instance {{ $labels.instance }} for {{ $labels.grpc_method }} method."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-etcd-operator/etcdGRPCRequestsSlow.md"
      summary     = "etcd grpc requests are slow"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdHighNumberOfFailedGRPCRequests-warning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(sum(rate(grpc_server_handled_total{job=\\\"etcd\\\", grpc_code=~\\\"Unknown|FailedPrecondition|ResourceExhausted|Internal|Unavailable|DataLoss|DeadlineExceeded\\\"}[5m])) without (grpc_type, grpc_code)\\n  /\\n(sum(rate(grpc_server_handled_total{job=\\\"etcd\\\"}[5m])) without (grpc_type, grpc_code)\\n  > 2 and on ()(sum(cluster_infrastructure_provider{type!~\\\"ipi|BareMetal\\\"} == bool 1)))) * 100 > 10\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": {{ $value }}% of requests for {{ $labels.grpc_method }} failed on etcd instance {{ $labels.instance }}."
      summary     = "etcd cluster has high number of failed grpc requests."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdHighNumberOfFailedGRPCRequests"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(sum(rate(grpc_server_handled_total{job=\\\"etcd\\\", grpc_code=~\\\"Unknown|FailedPrecondition|ResourceExhausted|Internal|Unavailable|DataLoss|DeadlineExceeded\\\"}[5m])) without (grpc_type, grpc_code)\\n  /\\n(sum(rate(grpc_server_handled_total{job=\\\"etcd\\\"}[5m])) without (grpc_type, grpc_code)\\n  > 2 and on ()(sum(cluster_infrastructure_provider{type!~\\\"ipi|BareMetal\\\"} == bool 1)))) * 100 > 50\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": {{ $value }}% of requests for {{ $labels.grpc_method }} failed on etcd instance {{ $labels.instance }}."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-etcd-operator/etcdHighNumberOfFailedGRPCRequests.md"
      summary     = "etcd cluster has high number of failed grpc requests."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdHighNumberOfLeaderChanges"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"avg(changes(etcd_server_is_leader[10m])) > 5\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description = "etcd cluster \"{{ $labels.job }}\": {{ $value }} average leader changes within the last 10 minutes. Frequent elections may be a sign of insufficient resources, high network latency, or disruptions by other components and should be investigated."
      summary     = "etcd cluster has high number of leader changes."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "etcdInsufficientMembers"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(up{job=\\\"etcd\\\"} == bool 1 and etcd_server_has_leader{job=\\\"etcd\\\"} == bool 1) without (instance,pod) < ((count(up{job=\\\"etcd\\\"}) without (instance,pod) + 1) / 2)\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "3m"
    annotations = {
      description = "etcd is reporting fewer instances are available than are needed ({{ $value }}). When etcd does not have a majority of instances available the Kubernetes and OpenShift APIs will reject read and write requests and operations that preserve the health of workloads cannot be performed. This can occur when multiple control plane nodes are powered off or are unable to connect to each other via the network. Check that all control plane nodes are powered on and that network connections between each machine are functional."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-etcd-operator/etcdInsufficientMembers.md"
      summary     = "etcd is reporting that a majority of instances are unavailable."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "ceph-mds-status" {
  disable_provenance = true
  name             = "ceph-mds-status"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephMdsMissingReplicas"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum by (namespace) (ceph_mds_metadata{job=\\\"rook-ceph-mgr\\\"} == 1) < 2\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "Minimum required replicas for storage metadata service not available. Might affect the working of storage cluster."
      message        = "Insufficient replicas for storage metadata service."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMdsMissingReplicas.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "ceph-mgr-status" {
  disable_provenance = true
  name             = "ceph-mgr-status"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephMgrIsAbsent"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"label_replace((up{job=\\\"rook-ceph-mgr\\\"} == 0 or absent(up{job=\\\"rook-ceph-mgr\\\"})), \\\"namespace\\\", \\\"openshift-storage\\\", \\\"\\\", \\\"\\\")\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "Ceph Manager has disappeared from Prometheus target discovery."
      message        = "Storage metrics collector service not available anymore."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMgrIsAbsent.md"
      severity_level = "critical"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephMgrIsMissingReplicas"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum by (namespace) (kube_deployment_spec_replicas{deployment=~\\\"rook-ceph-mgr-.*\\\"}) < 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "Ceph Manager is missing replicas."
      message        = "Storage metrics collector service doesn't have required no of replicas."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMgrIsMissingReplicas.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "ceph-node-alert-rules" {
  disable_provenance = true
  name             = "ceph-node-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephNodeDown"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"cluster:ceph_node_down:join_kube == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "30s"
    annotations = {
      description    = "Storage node {{ $labels.node }} went down. Please check the node immediately."
      message        = "Storage node {{ $labels.node }} went down"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephNodeDown.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "cluster-state-alert-rules" {
  disable_provenance = true
  name             = "cluster-state-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephClusterErrorState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_health_status{job=\\\"rook-ceph-mgr\\\"} > 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description    = "Storage cluster is in error state for more than 10m."
      message        = "Storage cluster is in error state"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephClusterErrorState.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephClusterWarningState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_health_status{job=\\\"rook-ceph-mgr\\\"} == 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description    = "Storage cluster is in warning state for more than 15m."
      message        = "Storage cluster is in degraded state"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephClusterWarningState.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephOSDVersionMismatch"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"count by (namespace) (count by (ceph_version, namespace) (ceph_osd_metadata{job=\\\"rook-ceph-mgr\\\", ceph_version != \\\"\\\"})) > 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description    = "There are {{ $value }} different versions of Ceph OSD components running."
      message        = "There are multiple versions of storage services running."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephOSDVersionMismatch.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephMonVersionMismatch"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"count by (namespace) (count by (ceph_version, namespace) (ceph_mon_metadata{job=\\\"rook-ceph-mgr\\\", ceph_version != \\\"\\\"})) > 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description    = "There are {{ $value }} different versions of Ceph Mon components running."
      message        = "There are multiple versions of storage services running."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMonVersionMismatch.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "cluster-utilization-alert-rules" {
  disable_provenance = true
  name             = "cluster-utilization-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephClusterNearFull"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_cluster_total_used_raw_bytes / ceph_cluster_total_bytes > 0.75\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5s"
    annotations = {
      description    = "Storage cluster utilization has crossed 75% and will become read-only at 85%. Free up some space or expand the storage cluster."
      message        = "Storage cluster is nearing full. Data deletion or cluster expansion is required."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephClusterNearFull.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephClusterCriticallyFull"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_cluster_total_used_raw_bytes / ceph_cluster_total_bytes > 0.80\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5s"
    annotations = {
      description    = "Storage cluster utilization has crossed 80% and will become read-only at 85%. Free up some space or expand the storage cluster immediately."
      message        = "Storage cluster is critically full and needs immediate data deletion or cluster expansion."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephClusterCriticallyFull.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephClusterReadOnly"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_cluster_total_used_raw_bytes / ceph_cluster_total_bytes >= 0.85\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "Storage cluster utilization has crossed 85% and will become read-only now. Free up some space or expand the storage cluster immediately."
      message        = "Storage cluster is read-only now and needs immediate data deletion or cluster expansion."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephClusterReadOnly.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "osd-alert-rules" {
  disable_provenance = true
  name             = "osd-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephOSDCriticallyFull"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ceph_osd_metadata * on (ceph_daemon, namespace) group_right(device_class,hostname) (ceph_osd_stat_bytes_used / ceph_osd_stat_bytes)) >= 0.80\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "40s"
    annotations = {
      description    = "Utilization of storage device {{ $labels.ceph_daemon }} of device_class type {{ $labels.device_class }} has crossed 80% on host {{ $labels.hostname }}. Immediately free up some space or add capacity of type {{ $labels.device_class }}."
      message        = "Back-end storage device is critically full."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephOSDCriticallyFull.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephOSDFlapping"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"changes(ceph_osd_up[5m]) >= 10\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "Storage daemon {{ $labels.ceph_daemon }} has restarted 10 times in last 5 minutes. Please check the pod events or ceph status to find out the cause."
      message        = "Ceph storage osd flapping."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephOSDFlapping.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephOSDNearFull"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ceph_osd_metadata * on (ceph_daemon, namespace) group_right(device_class,hostname) (ceph_osd_stat_bytes_used / ceph_osd_stat_bytes)) >= 0.75\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "40s"
    annotations = {
      description    = "Utilization of storage device {{ $labels.ceph_daemon }} of device_class type {{ $labels.device_class }} has crossed 75% on host {{ $labels.hostname }}. Immediately free up some space or add capacity of type {{ $labels.device_class }}."
      message        = "Back-end storage device is nearing full."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephOSDNearFull.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephOSDDiskNotResponding"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"label_replace((ceph_osd_in == 1 and ceph_osd_up == 0),\\\"disk\\\",\\\"$1\\\",\\\"ceph_daemon\\\",\\\"osd.(.*)\\\") + on(ceph_daemon, namespace) group_left(host, device) label_replace(ceph_disk_occupation{job=\\\"rook-ceph-mgr\\\"},\\\"host\\\",\\\"$1\\\",\\\"exported_instance\\\",\\\"(.*)\\\")\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description    = "Disk device {{ $labels.device }} not responding, on host {{ $labels.host }}."
      message        = "Disk not responding"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephOSDDiskNotResponding.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephOSDDiskUnavailable"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"label_replace((ceph_osd_in == 0 and ceph_osd_up == 0),\\\"disk\\\",\\\"$1\\\",\\\"ceph_daemon\\\",\\\"osd.(.*)\\\") + on(ceph_daemon, namespace) group_left(host, device) label_replace(ceph_disk_occupation{job=\\\"rook-ceph-mgr\\\"},\\\"host\\\",\\\"$1\\\",\\\"exported_instance\\\",\\\"(.*)\\\")\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Disk device {{ $labels.device }} not accessible on host {{ $labels.host }}."
      message        = "Disk not accessible"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephOSDDiskUnavailable.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephOSDSlowOps"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_healthcheck_slow_ops > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "30s"
    annotations = {
      description    = "{{ $value }} Ceph OSD requests are taking too long to process. Please check ceph status to find out the cause."
      message        = "OSD requests are taking too long to process."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephOSDSlowOps.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephDataRecoveryTakingTooLong"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_pg_undersized > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "2h"
    annotations = {
      description    = "Data recovery has been active for too long. Contact Support."
      message        = "Data recovery is slow"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephDataRecoveryTakingTooLong.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephPGRepairTakingTooLong"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ceph_pg_inconsistent > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1h"
    annotations = {
      description    = "Self heal operations taking too long. Contact Support."
      message        = "Self heal problems detected"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephPgRepairTakingTooLong.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "persistent-volume-alert-rules" {
  disable_provenance = true
  name             = "persistent-volume-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "PersistentVolumeUsageNearFull"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(kubelet_volume_stats_used_bytes * on (namespace,persistentvolumeclaim) group_left(storageclass, provisioner) (kube_persistentvolumeclaim_info * on (storageclass)  group_left(provisioner) kube_storageclass_info {provisioner=~\\\"(.*rbd.csi.ceph.com)|(.*cephfs.csi.ceph.com)\\\"})) / (kubelet_volume_stats_capacity_bytes * on (namespace,persistentvolumeclaim) group_left(storageclass, provisioner) (kube_persistentvolumeclaim_info * on (storageclass)  group_left(provisioner) kube_storageclass_info {provisioner=~\\\"(.*rbd.csi.ceph.com)|(.*cephfs.csi.ceph.com)\\\"})) > 0.75\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5s"
    annotations = {
      description    = "PVC {{ $labels.persistentvolumeclaim }} utilization has crossed 75%. Free up some space or expand the PVC."
      message        = "PVC {{ $labels.persistentvolumeclaim }} is nearing full. Data deletion or PVC expansion is required."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/PersistentVolumeUsageNearFull.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "PersistentVolumeUsageCritical"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(kubelet_volume_stats_used_bytes * on (namespace,persistentvolumeclaim) group_left(storageclass, provisioner) (kube_persistentvolumeclaim_info * on (storageclass)  group_left(provisioner) kube_storageclass_info {provisioner=~\\\"(.*rbd.csi.ceph.com)|(.*cephfs.csi.ceph.com)\\\"})) / (kubelet_volume_stats_capacity_bytes * on (namespace,persistentvolumeclaim) group_left(storageclass, provisioner) (kube_persistentvolumeclaim_info * on (storageclass)  group_left(provisioner) kube_storageclass_info {provisioner=~\\\"(.*rbd.csi.ceph.com)|(.*cephfs.csi.ceph.com)\\\"})) > 0.85\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5s"
    annotations = {
      description    = "PVC {{ $labels.persistentvolumeclaim }} utilization has crossed 85%. Free up some space or expand the PVC immediately."
      message        = "PVC {{ $labels.persistentvolumeclaim }} is critically full. Data deletion or PVC expansion is required."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/PersistentVolumeUsageCritical.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "pool-quota-rules" {
  disable_provenance = true
  name             = "pool-quota.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephPoolQuotaBytesNearExhaustion"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ceph_pool_stored_raw * on (pool_id) group_left(name, namespace)ceph_pool_metadata) / ((ceph_pool_quota_bytes * on (pool_id) group_left(name, namespace)ceph_pool_metadata) > 0) > 0.70\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Storage pool {{ $labels.name }} quota usage has crossed 70%."
      message        = "Storage pool quota(bytes) is near exhaustion."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephPoolQuotaBytesNearExhaustion.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephPoolQuotaBytesCriticallyExhausted"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ceph_pool_stored_raw * on (pool_id) group_left(name, namespace)ceph_pool_metadata) / ((ceph_pool_quota_bytes * on (pool_id) group_left(name, namespace)ceph_pool_metadata) > 0) > 0.90\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Storage pool {{ $labels.name }} quota usage has crossed 90%."
      message        = "Storage pool quota(bytes) is critically exhausted."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephPoolQuotaBytesCriticallyExhausted.md"
      severity_level = "critical"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "quorum-alert-rules" {
  disable_provenance = true
  name             = "quorum-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephMonQuorumAtRisk"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"count by (namespace) (ceph_mon_quorum_status{job=\\\"rook-ceph-mgr\\\"} == 1) <= (floor(count by (namespace) (ceph_mon_metadata{job=\\\"rook-ceph-mgr\\\"}) / 2) + 1)\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description    = "Storage cluster quorum is low. Contact Support."
      message        = "Storage quorum at risk"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMonQuorumAtRisk.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephMonQuorumLost"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"count by (namespace) (kube_pod_status_phase{pod=~\\\"rook-ceph-mon-.*\\\", phase=~\\\"Running|running\\\"} == 1) < 2\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "Storage cluster quorum is lost. Contact Support."
      message        = "Storage quorum is lost"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMonQuorumLost.md"
      severity_level = "critical"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CephMonHighNumberOfLeaderChanges"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ceph_mon_metadata{job=\\\"rook-ceph-mgr\\\"} * on (ceph_daemon, namespace) group_left() (rate(ceph_mon_num_elections{job=\\\"rook-ceph-exporter\\\"}[5m]) * 60)) > 0.95\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description    = "Ceph Monitor {{ $labels.ceph_daemon }} on host {{ $labels.hostname }} has seen {{ $value | printf \"%.2f\" }} leader changes per minute recently."
      message        = "Storage Cluster has seen many leader changes recently."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMonHighNumberOfLeaderChanges.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "logging_collector-alerts" {
  disable_provenance = true
  name             = "logging_collector.alerts"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CollectorNodeDown"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"up{app_kubernetes_io_component = \\\"collector\\\", app_kubernetes_io_part_of = \\\"cluster-logging\\\"} == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      message = "Prometheus could not scrape {{ $labels.namespace }}/{{ $labels.pod }} collector component for more than 10m."
      summary = "Collector cannot be scraped"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      service                       = "collector"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CollectorHighErrorRate"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"100 * (\\n    collector:log_num_errors:sum_rate{app_kubernetes_io_part_of = \\\"cluster-logging\\\"}\\n  /\\n    collector:received_events:sum_rate{app_kubernetes_io_part_of = \\\"cluster-logging\\\"}\\n  ) > 0.001\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message = "{{ $value }}% of records have resulted in an error by {{ $labels.namespace }}/{{ $labels.pod }} collector component."
      summary = "{{ $labels.namespace }}/{{ $labels.pod }} collector component errors are high"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      service                       = "collector"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CollectorVeryHighErrorRate"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"100 * (\\n    collector:log_num_errors:sum_rate{app_kubernetes_io_part_of = \\\"cluster-logging\\\"}\\n  /\\n    collector:received_events:sum_rate{app_kubernetes_io_part_of = \\\"cluster-logging\\\"}\\n  ) > 0.05\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message = "{{ $value }}% of records have resulted in an error by {{ $labels.namespace }}/{{ $labels.pod }} collector component."
      summary = "{{ $labels.namespace }}/{{ $labels.pod }} collector component errors are very high"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      service                       = "collector"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "FluentdQueueLengthIncreasing"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum by (pod,plugin_id) ( 0 * (deriv(fluentd_output_status_emit_records[1m] offset 1h)))  + on(pod,plugin_id)  ( deriv(fluentd_output_status_buffer_queue_length[10m]) > 0 and delta(fluentd_output_status_buffer_queue_length[1h]) > 1 )\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1h"
    annotations = {
      message = "For the last hour, fluentd {{ $labels.pod }} output '{{ $labels.plugin_id }}' average buffer queue length has increased continuously."
      summary = "Fluentd pod {{ $labels.pod }} is unable to keep up with traffic over time for forwarder output {{ $labels.plugin_id }}."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      service                       = "collector"
      severity                      = "Warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "ElasticsearchDeprecation"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(kube_pod_labels{namespace=\\\"openshift-logging\\\",label_component='elasticsearch'}) > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      message = "The OpenShift Elasticsearch Operator is deprecated and is planned to be removed in a future release. Red Hat provides bug fixes and support for this feature during the current release lifecycle, but this feature no longer receives enhancements. As an alternative to using the OpenShift Elasticsearch Operator to manage the default log storage, you can use the Loki Operator."
      summary = "Detected Elasticsearch as the in-cluster storage which is deprecated and will be removed in a future release."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      namespace                     = "openshift-logging"
      service                       = "storage"
      severity                      = "Warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "FluentdDeprecation"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(kube_pod_labels{namespace=\\\"openshift-logging\\\", label_implementation='fluentd', label_app_kubernetes_io_managed_by=\\\"cluster-logging-operator\\\"}) > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      message = "Fluentd is deprecated and is planned to be removed in a future release. Red Hat provides bug fixes and support for this feature during the current release lifecycle, but this feature no longer receives enhancements. As an alternative to Fluentd, you can use Vector instead."
      summary = "Detected Fluentd as the collector which is deprecated and will be removed in a future release."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      namespace                     = "openshift-logging"
      service                       = "collector"
      severity                      = "Warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "KibanaDeprecation"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(kube_pod_labels{namespace=\\\"openshift-logging\\\",label_component='kibana'}) > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      message = "The Kibana web console is now deprecated and is planned to be removed in a future logging release."
      summary = "Detected Kibana as the visualization which is deprecated and will be removed in a future release."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      namespace                     = "openshift-logging"
      service                       = "visualization"
      severity                      = "Warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "DiskBufferUsage"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(label_replace(sum by(hostname) (vector_buffer_byte_size{component_kind='sink', buffer_type='disk'}), 'instance', '$1', 'hostname', '(.*)') \\n/ on(instance) group_left() sum by(instance) (node_filesystem_size_bytes{mountpoint='/var'})) * 100  > 15\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      message = "Collectors potentially consuming too much node disk, {{ $value }}% "
      summary = "Detected consuming too much node disk on $labels.hostname host"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      service                       = "collector"
      severity                      = "Warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "cluster-network-operator-ovn-rules" {
  disable_provenance = true
  name             = "cluster-network-operator-ovn.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "NodeWithoutOVNKubeNodePodRunning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(kube_node_info unless on(node) (kube_pod_info{namespace=\\\"openshift-ovn-kubernetes\\\",pod=~\\\"ovnkube-node.*\\\"}\\nor kube_node_labels{label_kubernetes_io_os=\\\"windows\\\"})) > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "20m"
    annotations = {
      description = "Networking is degraded on nodes that do not have a functioning ovnkube-node pod. Existing workloads on the\nnode may continue to have connectivity but any changes to the networking control plane will not be implemented.\n"
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/NodeWithoutOVNKubeNodePodRunning.md"
      summary     = "All Linux nodes should be running an ovnkube-node pod, {{ $labels.node }} is not."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesControllerDisconnectedSouthboundDatabase"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"max_over_time(ovn_controller_southbound_database_connected[5m]) == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "Networking is degraded on nodes when OVN controller is not connected to OVN southbound database connection. No networking control plane updates will be applied to the node.\n"
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/OVNKubernetesControllerDisconnectedSouthboundDatabase.md"
      summary     = "Networking control plane is degraded on node {{ $labels.node }} because OVN controller is not connected to OVN southbound database."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesNodePodAddError"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(sum by(instance, namespace) (rate(ovnkube_node_cni_request_duration_seconds_count{command=\\\"ADD\\\",err=\\\"true\\\"}[5m]))\\n  /\\nsum by(instance, namespace) (rate(ovnkube_node_cni_request_duration_seconds_count{command=\\\"ADD\\\"}[5m])))\\n> 0.1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description = "OVN Kubernetes experiences pod creation errors at an elevated rate. The pods will be retried."
      summary     = "OVN Kubernetes is experiencing pod creation errors at an elevated rate."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesNodePodDeleteError"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(sum by(instance, namespace) (rate(ovnkube_node_cni_request_duration_seconds_count{command=\\\"DEL\\\",err=\\\"true\\\"}[5m]))\\n  /\\nsum by(instance, namespace) (rate(ovnkube_node_cni_request_duration_seconds_count{command=\\\"DEL\\\"}[5m])))\\n> 0.1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description = "OVN Kubernetes experiences pod deletion errors at an elevated rate. The pods will be retried."
      summary     = "OVN Kubernetes experiencing pod deletion errors at an elevated rate."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesResourceRetryFailure"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"increase(ovnkube_resource_retry_failures_total[10m]) > 0\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description = "OVN Kubernetes failed to apply networking control plane configuration after several attempts. This might be because the configuration\nprovided by the user is invalid or because of an internal error. As a consequence, the cluster might have a degraded status.\n"
      summary     = "OVN Kubernetes failed to apply networking control plane configuration."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesNodeOVSOverflowUserspace"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"increase(ovs_vswitchd_netlink_overflow[5m]) > 0\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description = "Netlink messages dropped by OVS vSwitch daemon due to netlink socket buffer overflow. This will result in packet loss."
      summary     = "OVS vSwitch daemon drops packets due to buffer overflow."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesNodeOVSOverflowKernel"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"increase(ovs_vswitchd_dp_flows_lookup_lost[5m]) > 0\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description = "Netlink messages dropped by OVS kernel module due to netlink socket buffer overflow. This will result in packet loss."
      summary     = "OVS kernel module drops packets due to buffer overflow."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NorthboundStale"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"# Without max_over_time, failed scrapes could create false negatives, see\\n# https://www.robustperception.io/alerting-on-gauges-in-prometheus-2-0 for details.\\ntime() - max_over_time(ovnkube_controller_nb_e2e_timestamp[5m]) > 120\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "OVN-Kubernetes controller and/or OVN northbound database may cause a\ndegraded networking control plane for the affected node. Existing\nworkloads should continue to have connectivity but new workloads may\nbe impacted.\n"
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/NorthboundStaleAlert.md"
      summary     = "OVN-Kubernetes controller {{ $labels.instance }} has not successfully synced any changes to the northbound database for too long."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "SouthboundStale"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"# Without max_over_time, failed scrapes could create false negatives, see\\n# https://www.robustperception.io/alerting-on-gauges-in-prometheus-2-0 for details.\\nmax_over_time(ovnkube_controller_nb_e2e_timestamp[5m]) - max_over_time(ovnkube_controller_sb_e2e_timestamp[5m]) > 120\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "OVN-Kubernetes controller and/or OVN northbound database may cause a\ndegraded networking control plane for the affected node. Existing\nworkloads should continue to have connectivity but new workloads may\nbe impacted.\n"
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/SouthboundStaleAlert.md"
      summary     = "OVN northd {{ $labels.instance }} has not successfully synced any changes to the southbound database for too long."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesNorthboundDatabaseCPUUsageHigh"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(sum(rate(container_cpu_usage_seconds_total{container=\\\"nbdb\\\"}[5m])) BY (instance, name, namespace)) > 0.8\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description = "High OVN northbound CPU usage indicates high load on the networking\ncontrol plane for the affected node.\n"
      summary     = "OVN northbound database {{ $labels.instance }} is greater than {{ $value | humanizePercentage }} percent CPU usage for a period of time."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "info"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesSouthboundDatabaseCPUUsageHigh"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(sum(rate(container_cpu_usage_seconds_total{container=\\\"sbdb\\\"}[5m])) BY (instance, name, namespace)) > 0.8\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      description = "High OVN southbound CPU usage indicates high load on the networking\ncontrol plane for the affected node.\n"
      summary     = "OVN southbound database {{ $labels.instance }} is greater than {{ $value | humanizePercentage }} percent CPU usage for a period of time."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "info"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OVNKubernetesNorthdInactive"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"count(ovn_northd_status != 1) BY (instance, name, namespace) > 0\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "An inactive OVN northd instance may cause a degraded networking\ncontrol plane for the affected node. Existing workloads should\ncontinue to have connectivity but new workloads may be impacted.\n"
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/OVNKubernetesNorthdInactive.md"
      summary     = "OVN northd {{ $labels.instance }} is not active."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "ceph-blocklist-alerts-rules" {
  disable_provenance = true
  name             = "ceph-blocklist-alerts.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "ODFRBDClientBlocked"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(\\n  ocs_rbd_client_blocklisted{node=~\\\".+\\\"} == 1\\n)\\nand on(node) (\\n  kube_pod_container_status_waiting_reason{reason=\\\"CreateContainerError\\\"}\\n  * on(pod, namespace, managedBy) group_left(node)\\n  kube_pod_info\\n) > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10s"
    annotations = {
      description    = "An RBD client might be blocked by Ceph on node {{ $labels.node_name }} in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}. This alert is triggered when the ocs_rbd_client_blocklisted metric reports a value of 1 for the node and there are pods in a CreateContainerError state on the node. This may cause the filesystem for the PVCs to be in a read-only state. Please check the pod description for more details."
      message        = "An RBD client might be blocked by Ceph on node {{ $labels.node_name }} in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ODFRBDClientBlocked.md"
      severity_level = "error"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "ceph-daemon-performance-alerts-rules" {
  disable_provenance = true
  name             = "ceph-daemon-performance-alerts.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "OSDCPULoadHigh"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"pod:container_cpu_usage:sum{pod=~\\\"rook-ceph-osd-.*\\\"} / on(pod) kube_pod_resource_limit{resource='cpu',pod=~\\\"rook-ceph-osd-.*\\\"} > 0.80\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "30m"
    annotations = {
      description    = "CPU usage for osd on pod {{ $labels.pod }} has exceeded 80%. Consider creating more OSDs to increase performance"
      message        = "High CPU usage detected in OSD container on pod {{ $labels.pod}}."
      severity_level = "warning"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "MDSCPUUsageHigh"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"pod:container_cpu_usage:sum{pod=~\\\"rook-ceph-mds.*\\\"}/ on(pod) kube_pod_resource_limit{resource='cpu',pod=~\\\"rook-ceph-mds.*\\\"} > 0.67\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "6h"
    annotations = {
      description    = "Ceph metadata server pod ({{ $labels.pod }}) has high cpu usage.\nPlease consider increasing the CPU request for the {{ $labels.pod }} pod as described in the runbook."
      message        = "Ceph metadata server pod ({{ $labels.pod }}) has high cpu usage"
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMdsCpuUsageHigh.md"
      severity_level = "warning"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "cluster-services-alert-rules" {
  disable_provenance = true
  name             = "cluster-services-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "ClusterObjectStoreState"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ocs_rgw_health_status{job=\\\"ocs-metrics-exporter\\\"} == 2\\nor\\nkube_deployment_status_replicas_ready{deployment=~\\\"rook-ceph-rgw-.*\\\"} < kube_deployment_spec_replicas{deployment=~\\\"rook-ceph-rgw-.*\\\"}\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15s"
    annotations = {
      description    = "RGW endpoint of the Ceph object store is in a failure state or one or more Rook Ceph RGW deployments have fewer ready replicas than required for more than 15s. Please check the health of the Ceph cluster and the deployments in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Cluster Object Store is in unhealthy state or number of ready replicas for Rook Ceph RGW deployments is less than the desired replicas in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ClusterObjectStoreState.md"
      severity_level = "error"
      storage_type   = "RGW"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "mirroring-alert-rules" {
  disable_provenance = true
  name             = "mirroring-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "OdfMirrorDaemonStatus"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"((count by(namespace, managedBy) (ocs_mirror_daemon_count{job=\\\"ocs-metrics-exporter\\\"} == 0)) * on(namespace, managedBy) group_left() (count by(namespace, managedBy) (ocs_pool_mirroring_status{job=\\\"ocs-metrics-exporter\\\"} == 1))) > 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Mirror daemon is in unhealthy status for more than 1m. Mirroring is not working as expected in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Mirror daemon is unhealthy in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/OdfMirrorDaemonStatus.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OdfPoolMirroringImageHealth-mirroring_image_status-unknown"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ocs_pool_mirroring_image_health{job=\\\"ocs-metrics-exporter\\\"}  * on (namespace, managedBy) group_left() (max by(namespace, managedBy) (ocs_pool_mirroring_status{job=\\\"ocs-metrics-exporter\\\"}))) == 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Mirroring image(s) (PV) in the pool {{ $labels.name }} are in Unknown state for more than 1m. Mirroring might not work as expected in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Mirroring image(s) (PV) in the pool {{ $labels.name }} are in Unknown state in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/OdfPoolMirroringImageHealth.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      mirroring_image_status        = "unknown"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OdfPoolMirroringImageHealth-mirroring_image_status-warning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ocs_pool_mirroring_image_health{job=\\\"ocs-metrics-exporter\\\"}  * on (namespace, managedBy) group_left() (max by(namespace, managedBy) (ocs_pool_mirroring_status{job=\\\"ocs-metrics-exporter\\\"}))) == 2\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Mirroring image(s) (PV) in the pool {{ $labels.name }} are in Warning state for more than 1m. Mirroring might not work as expected in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Mirroring image(s) (PV) in the pool {{ $labels.name }} are in Warning state for cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/OdfPoolMirroringImageHealth.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      mirroring_image_status        = "warning"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "OdfPoolMirroringImageHealth-mirroring_image_status-error"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ocs_pool_mirroring_image_health{job=\\\"ocs-metrics-exporter\\\"}  * on (namespace, managedBy) group_left() (max by(namespace, managedBy) (ocs_pool_mirroring_status{job=\\\"ocs-metrics-exporter\\\"}))) == 3\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10s"
    annotations = {
      description    = "Mirroring image(s) (PV) in the pool {{ $labels.name }} are in Error state for more than 10s. Mirroring is not working as expected in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Mirroring image(s) (PV) in the pool {{ $labels.name }} are in Error state for cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/OdfPoolMirroringImageHealth.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      mirroring_image_status        = "error"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "ODFPersistentVolumeMirrorStatus"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ocs_rbd_mirror_image_state{job=\\\"ocs-metrics-exporter\\\"} * on(image,pool_name) group_left(name,namespace,managedBy) ocs_rbd_pv_metadata{job=\\\"ocs-metrics-exporter\\\"} == 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Persistent volume {{ $labels.name }}/{{ $labels.namespace }} is not mirrored properly to peer site {{ $labels.site_name }} for more than 1m. RBD image={{ $labels.image }} and CephBlockPool={{ $labels.pool_name }}. Please check namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Persistent volume {{ $labels.name }}/{{ $labels.namespace }} is not mirrored properly to peer site {{ $labels.site_name }} in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ODFPersistentVolumeMirrorStatus.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "ODFPersistentVolumeMirrorStatus-warning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ocs_rbd_mirror_image_state{job=\\\"ocs-metrics-exporter\\\"} * on(image,pool_name) group_left(name,namespace,managedBy) ocs_rbd_pv_metadata{job=\\\"ocs-metrics-exporter\\\"} == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      description    = "Status unknown for Persistent volume {{ $labels.name }}/{{ $labels.namespace }} to peer site {{ $labels.site_name }} for more than 1m. RBD image={{ $labels.image }} and CephBlockPool={{ $labels.pool_name }}. Please check namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}"
      message        = "Status unknown for Persistent volume {{ $labels.name }}/{{ $labels.namespace }} mirroring to peer site {{ $labels.site_name }} in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ODFPersistentVolumeMirrorStatus.md"
      severity_level = "warning"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "ocs-encryption-alert-rules" {
  disable_provenance = true
  name             = "ocs-encryption-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "KMSServerConnectionAlert"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ocs_storagecluster_kms_connection_status{job=\\\"ocs-metrics-exporter\\\"} == 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5s"
    annotations = {
      description    = "Storage Cluster KMS Server is in un-connected state for more than 5s. Please check KMS config in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Storage Cluster KMS Server is in un-connected state. Please check KMS config in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/KMSServerConnectionAlert.md"
      severity_level = "error"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "odf-obc-quota-alert-rules" {
  disable_provenance = true
  name             = "odf-obc-quota-alert.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "ObcQuotaBytesAlert"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ocs_objectbucketclaim_info * on (namespace, objectbucket, managedBy) group_left() (ocs_objectbucket_used_bytes/ocs_objectbucket_max_bytes)) > 0.80\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10s"
    annotations = {
      description    = "ObjectBucketClaim {{ $labels.objectbucketclaim }} has crossed 80% of the size limit set by the quota(bytes) and will become read-only on reaching the quota limit in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}. Increase the quota in the {{ $labels.objectbucketclaim }} OBC custom resource."
      message        = "OBC has crossed 80% of the quota(bytes) in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ObcQuotaBytesAlert.md"
      severity_level = "warning"
      storage_type   = "RGW"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "ObcQuotaObjectsAlert"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ocs_objectbucketclaim_info * on (namespace, managedBy, objectbucket) group_left() (ocs_objectbucket_objects_total/ocs_objectbucket_max_objects)) > 0.80\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10s"
    annotations = {
      description    = "ObjectBucketClaim {{ $labels.objectbucketclaim }} has crossed 80% of the size limit set by the quota(objects) and will become read-only on reaching the quota limit in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}. Increase the quota in the {{ $labels.objectbucketclaim }} OBC custom resource."
      message        = "OBC has crossed 80% of the quota(object) in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ObcQuotaObjectsAlert.md"
      severity_level = "warning"
      storage_type   = "RGW"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "ObcQuotaBytesExhausedAlert"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ocs_objectbucketclaim_info * on (namespace, managedBy, objectbucket) group_left() (ocs_objectbucket_used_bytes/ocs_objectbucket_max_bytes)) >= 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "ObjectBucketClaim {{ $labels.objectbucketclaim }} has crossed the limit set by the quota(bytes) and will be read-only now in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}. Increase the quota in the {{ $labels.objectbucketclaim }} OBC custom resource immediately."
      message        = "OBC reached quota(bytes) limit in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ObcQuotaBytesExhausedAlert.md"
      severity_level = "error"
      storage_type   = "RGW"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "ObcQuotaObjectsExhausedAlert"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(ocs_objectbucketclaim_info * on (namespace, managedBy, objectbucket) group_left() (ocs_objectbucket_objects_total/ocs_objectbucket_max_objects)) >= 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "ObjectBucketClaim {{ $labels.objectbucketclaim }} has crossed the limit set by the quota(objects) and will be read-only now in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}. Increase the quota in the {{ $labels.objectbucketclaim }} OBC custom resource immediately."
      message        = "OBC reached quota(object) limit in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/ObcQuotaObjectsExhausedAlert.md"
      severity_level = "error"
      storage_type   = "RGW"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "storage-client-alerts-rules" {
  disable_provenance = true
  name             = "storage-client-alerts.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "StorageClientHeartbeatMissed-warning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(time() - 120) > (ocs_storage_client_last_heartbeat > 0)\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "Storage Client ({{ $labels.storage_consumer_name }}) heartbeat missed for more than 120 (s). Lossy network connectivity might exist in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Storage Client ({{ $labels.storage_consumer_name }}) heartbeat missed for more than 120 (s) in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      severity_level = "warning"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "StorageClientHeartbeatMissed"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(time() - 300) > (ocs_storage_client_last_heartbeat > 0)\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "Storage Client ({{ $labels.storage_consumer_name }}) heartbeat missed for more than 300 (s). Client might have lost internet connectivity in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Storage Client ({{ $labels.storage_consumer_name }}) heartbeat missed for more than 300 (s) in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      severity_level = "critical"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "StorageClientIncompatibleOperatorVersion-warning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"floor((ocs_storage_provider_operator_version>0)/1000) - ignoring(storage_consumer_name) group_right() floor((ocs_storage_client_operator_version>0)/1000) == 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "Storage Client Operator ({{ $labels.storage_consumer_name }}) lags by 1 minor version. Client configuration may be incompatible in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Storage Client Operator ({{ $labels.storage_consumer_name }}) lags by 1 minor version in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      severity_level = "warning"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "StorageClientIncompatibleOperatorVersion"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"floor((ocs_storage_provider_operator_version>0)/1000) - ignoring(storage_consumer_name) group_right() floor((ocs_storage_client_operator_version>0)/1000) > 1 or floor((ocs_storage_client_operator_version>0)/1000) - ignoring(storage_consumer_name) group_left() floor((ocs_storage_provider_operator_version>0)/1000) >= 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "Storage Client Operator ({{ $labels.storage_consumer_name }}) differs by more than 1 minor version. Client configuration may be incompatible and unsupported in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      message        = "Storage Client Operator ({{ $labels.storage_consumer_name }}) differs by more than 1 minor version in namespace:cluster {{ $labels.namespace }}:{{ $labels.managedBy }}."
      severity_level = "critical"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "storage-cluster-alerts-rules" {
  disable_provenance = true
  name             = "storage-cluster-alerts.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CephMonLowNumber"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"((count by (managedBy, namespace) (ceph_mon_metadata)<5) - on(managedBy,namespace) group_right() (ocs_storagecluster_failure_domain_count>=5)) < 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      description    = "The number of failure zones available allow to increase the number of Ceph monitors from 3 to 5 in order to improve cluster resilience."
      message        = "The current number of Ceph monitors can be increased in order to improve cluster resilience."
      runbook_url    = "https://github.com/openshift/runbooks/blob/master/alerts/openshift-container-storage-operator/CephMonLowNumber.md"
      severity_level = "info"
      storage_type   = "ceph"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "info"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "openshift-dns-rules" {
  disable_provenance = true
  name             = "openshift-dns.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "CoreDNSPanicking"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"increase(coredns_panics_total[10m]) > 0\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description = "{{ $value }} CoreDNS panics observed on {{ $labels.instance }}"
      summary     = "CoreDNS panic"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CoreDNSHealthCheckSlow"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(.95, sum(rate(coredns_health_request_duration_seconds_bucket[5m])) by (instance, le)) > 10\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description = "CoreDNS Health Checks are slowing down (instance {{ $labels.instance }})"
      summary     = "CoreDNS health checks"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "CoreDNSErrorsHigh"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"(sum by(namespace) (rate(coredns_dns_responses_total{rcode=\\\"SERVFAIL\\\"}[5m]))\\n  /\\nsum by(namespace) (rate(coredns_dns_responses_total[5m])))\\n> 0.01\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description = "CoreDNS is returning SERVFAIL for {{ $value | humanizePercentage }} of requests."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-dns-operator/CoreDNSErrorsHigh.md"
      summary     = "CoreDNS serverfail"
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "logging_loki-alerts" {
  disable_provenance = true
  name             = "logging_loki.alerts"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "LokiRequestErrors"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(\\n  job_namespace_route_statuscode:loki_request_duration_seconds_count:irate1m{status_code=~\\\"5..\\\"}\\n) by (job, namespace, route)\\n/\\nsum(\\n  job_namespace_route_statuscode:loki_request_duration_seconds_count:irate1m\\n) by (job, namespace, route)\\n* 100\\n> 10\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "{{ $labels.job }} {{ $labels.route }} is experiencing {{ printf \"%.2f\" $value }}% errors."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Request-Errors"
      summary     = "At least 10% of requests are responded by 5xx server errors."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiStackWriteRequestErrors"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(\\n  code_handler_job_namespace:lokistack_gateway_http_requests:irate1m{code=~\\\"5..\\\", handler=\\\"push\\\"}\\n) by (job, namespace)\\n/\\nsum(\\n  code_handler_job_namespace:lokistack_gateway_http_requests:irate1m{handler=\\\"push\\\"}\\n) by (job, namespace)\\n* 100\\n> 10\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "{{ printf \"%.2f\" $value }}% of write requests from {{ $labels.job }} in {{ $labels.namespace }} are returned with server errors."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#LokiStack-Write-Request-Errors"
      summary     = "At least 10% of write requests to the lokistack-gateway are responded with 5xx server errors."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiStackReadRequestErrors"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(\\n  code_handler_job_namespace:lokistack_gateway_http_requests:irate1m{code=~\\\"5..\\\", handler=~\\\"query|query_range|label|labels|label_values\\\"}\\n) by (job, namespace)\\n/\\nsum(\\n  code_handler_job_namespace:lokistack_gateway_http_requests:irate1m{handler=~\\\"query|query_range|label|labels|label_values\\\"}\\n) by (job, namespace)\\n* 100\\n> 10\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "{{ printf \"%.2f\" $value }}% of query requests from {{ $labels.job }} in {{ $labels.namespace }} are returned with server errors."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#LokiStack-Read-Request-Errors"
      summary     = "At least 10% of query requests to the lokistack-gateway are responded with 5xx server errors."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiRequestPanics"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(\\n  increase(\\n    loki_panic_total[10m]\\n  )\\n) by (job, namespace)\\n> 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    annotations = {
      message     = "{{ $labels.job }} is experiencing an increase of {{ $value }} panics."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Request-Panics"
      summary     = "A panic was triggered."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiRequestLatency"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99,\\n  sum(\\n    irate(\\n      loki_request_duration_seconds_bucket{route!~\\\"(?i).*tail.*\\\"}[1m]\\n    )\\n  ) by (job, le, namespace, route)\\n)\\n> 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "{{ $labels.job }} {{ $labels.route }} is experiencing {{ printf \"%.2f\" $value }}s 99th percentile latency."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Request-Latency"
      summary     = "The 99th percentile is experiencing high latency (higher than 1 second)."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiTenantRateLimit"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(\\n  job_namespace_route_statuscode:loki_request_duration_seconds_count:irate1m{status_code=\\\"429\\\"}\\n) by (job, namespace, route)\\n/\\nsum(\\n  job_namespace_route_statuscode:loki_request_duration_seconds_count:irate1m\\n) by (job, namespace, route)\\n* 100\\n> 10\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "{{ $labels.job }} {{ $labels.route }} is experiencing 429 errors."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Tenant-Rate-Limit"
      summary     = "At least 10% of requests are responded with the rate limit error code."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiStorageSlowWrite"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99,\\n  sum(\\n    job_le_namespace_operation:loki_boltdb_shipper_request_duration_seconds_bucket:rate5m{operation=\\\"WRITE\\\"}\\n  ) by (job, le, namespace)\\n)\\n> 1\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "The storage path is experiencing slow write response rates."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Storage-Slow-Write"
      summary     = "The storage path is experiencing slow write response rates."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiStorageSlowRead"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99,\\n  sum(\\n    job_le_namespace_operation:loki_boltdb_shipper_request_duration_seconds_bucket:rate5m{operation=\\\"Shipper.Query\\\"}\\n  ) by (job, le, namespace)\\n)\\n> 5\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "The storage path is experiencing slow read response rates."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Storage-Slow-Read"
      summary     = "The storage path is experiencing slow read response rates."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiWritePathHighLoad"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum(\\n  loki_ingester_wal_replay_flushing\\n) by (job, namespace)\\n> 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "The write path is experiencing high load."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Write-Path-High-Load"
      summary     = "The write path is experiencing high load, causing backpressure storage flushing."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiReadPathHighLoad"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"histogram_quantile(0.99,\\n  sum(\\n    rate(\\n      loki_logql_querystats_latency_seconds_bucket[5m]\\n    )\\n  ) by (job, le, namespace)\\n)\\n> 30\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "The read path is experiencing high load."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Read-Path-High-Load"
      summary     = "The read path has high volume of queries, causing longer response times."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokiDiscardedSamplesWarning"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum by(namespace, tenant, reason) (\\n  irate(loki_discarded_samples_total{\\n    reason!=\\\"rate_limited\\\",\\n    reason!=\\\"per_stream_rate_limit\\\",\\n    reason!=\\\"stream_limit\\\"}[2m])\\n)\\n> 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "15m"
    annotations = {
      message     = "Loki in namespace {{ $labels.namespace }} is discarding samples in the \"{{ $labels.tenant }}\" tenant during ingestion.\nSamples are discarded because of \"{{ $labels.reason }}\" at a rate of {{ .Value | humanize }} samples per second."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Loki-Discarded-Samples-Warning"
      summary     = "Loki is discarding samples during ingestion because they fail validation."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "LokistackSchemaUpgradesRequired"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"sum (\\n  lokistack_status_condition{reason=\\\"StorageNeedsSchemaUpdate\\\",status=\\\"true\\\"}\\n) by (stack_namespace, stack_name)\\n> 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "1m"
    annotations = {
      message     = "The LokiStack \"{{ $labels.stack_name }}\" in namespace \"{{ $labels.stack_namespace }}\" is using a storage schema\nconfiguration that does not contain the latest schema version. It is recommended to update the schema\nconfiguration to update the schema version to the latest version in the future."
      runbook_url = "https://github.com/grafana/loki/blob/main/operator/docs/lokistack/sop.md#Lokistack-Schema-Upgrades-Required"
      summary     = "One or more of the deployed LokiStacks contains an outdated storage schema configuration."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
resource "grafana_rule_group" "cluster-network-operator-master-rules" {
  disable_provenance = true
  name             = "cluster-network-operator-master.rules"
  folder_uid       = grafana_folder.RHOCP_OPS_EXTRA.uid
  interval_seconds = 60

  rule {
    name      = "V4SubnetAllocationThresholdExceeded"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ovnkube_clustermanager_allocated_v4_host_subnets / ovnkube_clustermanager_num_v4_host_subnets > 0.8\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "More than 80% of IPv4 subnets are used. Insufficient IPv4 subnets could degrade provisioning of workloads."
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/V4SubnetAllocationThresholdExceeded.md"
      summary     = "More than 80% of v4 subnets available to assign to the nodes are allocated. Current v4 subnet allocation percentage is {{ $value | humanizePercentage }}."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "V6SubnetAllocationThresholdExceeded"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"ovnkube_clustermanager_allocated_v6_host_subnets / ovnkube_clustermanager_num_v6_host_subnets > 0.8\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "10m"
    annotations = {
      description = "More than 80% of IPv6 subnets are used. Insufficient IPv6 subnets could degrade provisioning of workloads."
      summary     = "More than 80% of the v6 subnets available to assign to the nodes are allocated. Current v6 subnet allocation percentage is {{ $value | humanizePercentage }}."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "warning"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NoRunningOvnControlPlane"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"absent(up{job=\\\"ovnkube-control-plane\\\", namespace=\\\"openshift-ovn-kubernetes\\\"} == 1)\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description = "Networking control plane is degraded. Networking configuration updates applied to the cluster will not be\nimplemented while there are no OVN Kubernetes control plane pods.\n"
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/NoRunningOvnControlPlane.md"
      summary     = "There is no running ovn-kubernetes control plane."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      namespace                     = "openshift-ovn-kubernetes"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
  rule {
    name      = "NoOvnClusterManagerLeader"
    condition = "threshold"

    data {
      ref_id     = "query"
      query_type = "prometheus"

      relative_time_range {
        from = 660
        to   = 60
      }

      datasource_uid = data.grafana_data_source.my_target_data_source.uid
      model          = "{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"bevfpbwo6gtmof\"},\"expr\":\"# Without max_over_time, failed scrapes could create false negatives, see\\n# https://www.robustperception.io/alerting-on-gauges-in-prometheus-2-0 for details.\\nmax by (namespace) (max_over_time(ovnkube_clustermanager_leader[5m])) == 0\\n\",\"instant\":true,\"intervalMs\":1000,\"maxDataPoints\":43200,\"range\":false,\"refId\":\"query\"}"
    }
    data {
      ref_id     = "prometheus_math"
      query_type = "math"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"is_number($query) || is_nan($query) || is_inf($query)\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"prometheus_math\",\"type\":\"math\"}"
    }
    data {
      ref_id     = "threshold"
      query_type = "threshold"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model          = "{\"conditions\":[{\"evaluator\":{\"params\":[0],\"type\":\"gt\"}}],\"datasource\":{\"IsPrunable\":false,\"access\":\"\",\"apiVersion\":\"\",\"basicAuth\":false,\"basicAuthUser\":\"\",\"created\":\"0001-01-01T00:00:00Z\",\"database\":\"\",\"id\":-100,\"isDefault\":false,\"jsonData\":{},\"name\":\"__expr__\",\"readOnly\":false,\"secureJsonData\":{},\"type\":\"__expr__\",\"uid\":\"__expr__\",\"updated\":\"0001-01-01T00:00:00Z\",\"url\":\"\",\"user\":\"\",\"withCredentials\":false},\"expression\":\"prometheus_math\",\"intervalMs\":1000,\"maxDataPoints\":43200,\"refId\":\"threshold\",\"type\":\"threshold\"}"
    }

    no_data_state  = "OK"
    exec_err_state = "OK"
    for            = "5m"
    annotations = {
      description = "Networking control plane is degraded. Networking configuration updates applied to the cluster will not be\nimplemented while there is no OVN Kubernetes cluster manager leader. Existing workloads should continue to have connectivity.\nOVN-Kubernetes control plane is not functional.\n"
      runbook_url = "https://github.com/openshift/runbooks/blob/master/alerts/cluster-network-operator/NoOvnClusterManagerLeader.md"
      summary     = "There is no ovn-kubernetes cluster manager leader."
    }
    labels = {
      __converted_prometheus_rule__ = "true"
      severity                      = "critical"
    }
    is_paused                       = false
    missing_series_evals_to_resolve = 1
  }
}
