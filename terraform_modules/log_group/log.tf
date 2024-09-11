resource "oci_logging_log_group" "log_group" {
    #Required
    compartment_id = var.compartment_id
    display_name = var.log_group_display_name

    #Optional
    #defined_tags = {"Operations.CostCenter"= "42"}
    description = var.log_group_description
    #freeform_tags = {"Department"= "Finance"}
}