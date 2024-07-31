
account_id  = 4438263
policy_name1 = "apm-policy-foreach"
# policy_name2 = "apm-policy"
# policy_name3 = "browser-policy"
app_name    = "task"


conditionss = {
   "condition1"= {
    name                = "condition1"
    critical_threshold  = 90
    query                = "FROM Transaction SELECT apdex(duration, 0.5) WHERE appName = 'apm-vs-relicstaurants'"
    critical_duration   = 300
    threshold_occurrences = "all"
    warning_threshold   = 80
    warning_duration    = 600
    },

    "condition2"= {
    name                = "condition2"
    critical_threshold  = 90
    query                = "FROM Transaction SELECT count(*) WHERE appName = 'apm-vs-relicstaurants'"
    critical_duration   = 300
    threshold_occurrences = "all"
    warning_threshold   = 80
    warning_duration    = 600

 
    }
    

}