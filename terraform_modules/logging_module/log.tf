data "oci_logging_log_groups" "cg_log_groups" {
    #Required
    compartment_id = var.compartment_id
}

resource "oci_logging_log" "cg_log" {
    #Required
    display_name = var.log_name
    #log_group_id = data.oci_logging_log_groups.cg_log_groups.log_groups[0].id
    log_group_id = var.log_group_id
    log_type = var.log_type

    #Optional
    configuration {
        #Required
        source {
            #Required
            category = var.log_category
            resource = var.log_resource_id
            service = var.log_service
            source_type = var.log_source_type
        }

    }
    is_enabled = var.is_log_enabled
    retention_duration = var.log_retention_duration
}