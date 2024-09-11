resource "oci_data_safe_data_safe_private_endpoint" "ds_pvt_endpoint" {
    #Required
    compartment_id = var.compartment_id
    display_name = var.data_safe_display_name
    subnet_id = var.db_subnet_id
    vcn_id = var.vcn_id

    #Optional
    description = var.ds_pvt_endpoint_desc
}

resource "oci_data_safe_target_database" "cg_target_database" {
    #Required
    compartment_id = var.compartment_id
    database_details {
        #Required
        database_type = var.target_database_type
        infrastructure_type = var.database_infrastructure_type

        #Optional
        db_system_id = var.db_system_id
        service_name = var.db_service_name
    }

    #Optional
    connection_option {
        #Required
        connection_type = var.ds_connection_type

        #Optional
        datasafe_private_endpoint_id = oci_data_safe_data_safe_private_endpoint.ds_pvt_endpoint.id
    }
    credentials {
        #Required
        password = var.ds_admin_password
        user_name = var.ds_admin_user
    }
#    description = var.target_database_desc
    display_name = var.target_database_display_name

}
