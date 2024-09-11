resource "oci_monitoring_alarm" "db_alarm_cpu_util_warn" {

  count = var.cpu_alarm ? 1 :0 

     #Required
  compartment_id        = var.compartment_id
  destinations          = [var.topic_id]
  display_name          = var.cpu_warn_display_name
  is_enabled            = "true"
  metric_compartment_id = var.compartment_id
  namespace             = "oracle_oci_database"
  query =   "CpuUtilization[1m]{resourceId =\"${var.database_id}\"}.mean() in (${var.cpu_warn_low},${var.cpu_warn_high})"
  severity              = "WARNING"#"CRITICAL"

  #Optional
  body                             = "DB CPU Utilization has reached warning level"
  message_format                   = "ONS_OPTIMIZED"
  pending_duration                 = var.cpu_warn_pending_duration
  repeat_notification_duration     = var.cpu_warn_repeat_notification_interval

}

resource "oci_monitoring_alarm" "db_alarm_cpu_util_critical" {

  count = var.cpu_alarm ? 1 :0 

     #Required
  compartment_id        = var.compartment_id
  destinations          = [var.topic_id]
  display_name          = var.cpu_critical_display_name
  is_enabled            = "true"
  metric_compartment_id = var.compartment_id
  namespace             = "oracle_oci_database"
  query =   "CpuUtilization[1m]{resourceId =\"${var.database_id}\"}.mean() >= ${var.cpu_critical}"
  severity              = "CRITICAL"

  #Optional
  body                             = "DB CPU Utilization has reached critical level"
  message_format                   = "ONS_OPTIMIZED"
  pending_duration                 = var.cpu_critical_pending_duration
  repeat_notification_duration     = var.cpu_critical_repeat_notification_interval

}


resource "oci_monitoring_alarm" "db_alarm_storage_util_warn" {

  count = var.storage_alarm ? 1 :0 

     #Required
  compartment_id        = var.compartment_id
  destinations          = [var.topic_id]
  display_name          = var.storage_warn_display_name
  is_enabled            = "true"
  metric_compartment_id = var.compartment_id
  namespace             = "oracle_oci_database"
  query =   "StorageUtilization[60m]{resourceId =\"${var.database_id}\"}.mean() in (${var.storage_warn_low},${var.storage_warn_high})"
  severity              = "WARNING"

  #Optional
  body                             = "DB Storage Utilization has reached warning level"
  message_format                   = "ONS_OPTIMIZED"
  pending_duration                 = var.storage_warn_pending_duration
  repeat_notification_duration     = var.storage_warn_repeat_notification_interval

}

resource "oci_monitoring_alarm" "db_alarm_storage_util_critical" {

  count = var.storage_alarm ? 1 :0 

     #Required
  compartment_id        = var.compartment_id
  destinations          = [var.topic_id]
  display_name          = var.storage_critical_display_name
  is_enabled            = "true"
  metric_compartment_id = var.compartment_id
  namespace             = "oracle_oci_database"
  query =   "StorageUtilization[60m]{resourceId =\"${var.database_id}\"}.mean() >= ${var.storage_critical}"
  severity              = "CRITICAL"

  #Optional
  body                             = "DB Storage Utilization has reached critical level"
  message_format                   = "ONS_OPTIMIZED"
  pending_duration                 = var.storage_critical_pending_duration
  repeat_notification_duration     = var.storage_critical_repeat_notification_interval

}

resource "oci_monitoring_alarm" "db_alarm_session_count_warn" {

  count = var.session_alarm ? 1 :0 

     #Required
  compartment_id        = var.compartment_id
  destinations          = [var.topic_id]
  display_name          = var.session_warn_display_name
  is_enabled            = "true"
  metric_compartment_id = var.compartment_id
  namespace             = "oracle_oci_database"
  query =   "CurrentLogons[1m]{resourceId =\"${var.database_id}\"}.sum() in (${var.sessions_warn_low},${var.sessions_warn_high})"
  severity              = "WARNING"#"CRITICAL"

  #Optional
  body                             = "DB session count has reached warning level"
  message_format                   = "ONS_OPTIMIZED"
  pending_duration                 = var.session_warn_pending_duration
  repeat_notification_duration     = var.session_warn_repeat_notification_interval

}

resource "oci_monitoring_alarm" "db_alarm_session_count_critical" {

  count = var.session_alarm ? 1 :0 

     #Required
  compartment_id        = var.compartment_id
  destinations          = [var.topic_id]
  display_name          = var.session_critical_display_name
  is_enabled            = "true"
  metric_compartment_id = var.compartment_id
  namespace             = "oracle_oci_database"
  query =   "CurrentLogons[1m]{resourceId =\"${var.database_id}\"}.sum() >= ${var.session_critical}"
  severity              = "CRITICAL"

  #Optional
  body                             = "DB session count has reached critical level"
  message_format                   = "ONS_OPTIMIZED"
  pending_duration                 = var.session_critical_pending_duration
  repeat_notification_duration     = var.session_critical_repeat_notification_interval

}