resource "oci_identity_dynamic_group" "test_dynamic_group" {
    #Required
    compartment_id       = var.compartment_id
    description          = var.dynamic_group_description
    matching_rule        = var.dynamic_group_matching_rule
    name                 = var.dynamic_group_name

}