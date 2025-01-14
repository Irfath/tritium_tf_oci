#resource "oci_monitoring_alarm" "test_alarm" {

 resource "oci_monitoring_alarm" "create_alarm" {
    #Required
    compartment_id = var.compartment_ocid
    #destinations = [oci_ons_notification_topic.test_notification_topic.id]
    
    
    destinations = var.topic_id
    display_name = var.alarm_display_name
    is_enabled = var.alarm_is_enabled
    metric_compartment_id = var.alarm_metric_compartment_id
    namespace = var.alarm_namespace
    query = var.alarm_query
    severity = var.alarm_severity

    #Optional
    body = var.alarm_body
   # defined_tags = {"Operations.CostCenter"= "42"}
   # freeform_tags = {"Department"= "Finance"}
    ####defined_tags =var.defined_tags
    ####freeform_tags = local.merged_freeform_tags

    defined_tags = var.default_defined_tags
    freeform_tags = var.default_freeform_tags

    is_notifications_per_metric_dimension_enabled = var.alarm_is_notifications_per_metric_dimension_enabled
    message_format = var.alarm_message_format
    metric_compartment_id_in_subtree = var.alarm_metric_compartment_id_in_subtree
    pending_duration = var.alarm_pending_duration
    repeat_notification_duration = var.alarm_repeat_notification_duration
    resolution = var.alarm_resolution
    resource_group = var.alarm_resource_group
   
   suppression {
        #Required
        #time_suppress_from =  timeadd(timestamp(), "5m")
        time_suppress_from =  var.alarm_suppression_time_suppress_from
        time_suppress_until = var.alarm_suppression_time_suppress_until

        #Optional
        description = var.alarm_suppression_description
    }
    
}