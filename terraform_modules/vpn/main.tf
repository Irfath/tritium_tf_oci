data "oci_core_cpe_device_shapes" "main_device_shapes" {

}


resource "oci_core_cpe" "main" {
    #Required
    compartment_id = var.compartment_id
    ip_address = var.cpe_ip_address

    #Optional
    cpe_device_shape_id = data.oci_core_cpe_device_shapes.main_device_shapes.cpe_device_shapes.1.cpe_device_shape_id
    #defined_tags = {"Operations.CostCenter"= "42"}
    display_name = var.cpe_display_name
    freeform_tags = var.freeform_tags
}


resource "oci_core_ipsec" "test_ip_sec_connection" {
    #Required
    compartment_id = var.compartment_id
    cpe_id = oci_core_cpe.main.id
    drg_id = var.drg_id
    static_routes = var.ip_sec_connection_static_routes


    #Optional
#    cpe_local_identifier = var.ip_sec_connection_cpe_local_identifier
#    cpe_local_identifier_type = var.ip_sec_connection_cpe_local_identifier_type
    #defined_tags = {"Operations.CostCenter"= "42"}
    display_name = var.ip_sec_connection_display_name
    #freeform_tags = {"Department"= "Finance"}
}