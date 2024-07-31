# Define the New Relic alert policy
resource "newrelic_alert_policy" "apm-policy" {
  name = var.policy_name1
}

# Define NRQL alert conditions based on variables
resource "newrelic_nrql_alert_condition" "apm_Conditions" {
 
 for_each =  var.conditionss

  account_id                     = var.account_id
  policy_id                      = newrelic_alert_policy.apm-policy.id
  type                           = "static"
  name                           = each.value.name
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 80
   aggregation_method             = "event_flow"
   aggregation_delay              = 60
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = each.value.query
  }
  critical {
    operator              = "above"
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.critical_duration
    threshold_occurrences = each.value.threshold_occurrences
  }

  warning {
    operator              = "above"
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.warning_duration
    threshold_occurrences = each.value.threshold_occurrences
  }
}
