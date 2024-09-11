resource "oci_database_autonomous_database" "main" {


    #Required
    compartment_id = "${var.compartment_id}"
    db_name = "${var.db_name}"




    #Optional
    admin_password = "${var.admin_password}"
    are_primary_whitelisted_ips_used = "${var.are_primary_whitelisted_ips_used}"
    autonomous_container_database_id = "${var.autonomous_container_database_id}"
    autonomous_database_backup_id = "${var.autonomous_database_backup_id}"
    autonomous_database_id = "${var.autonomous_database_id}"
    clone_type = "${var.clone_type}"
    cpu_core_count = "${var.cpu_core_count}"

    # for AMD ECPU
    compute_model = "${var.compute_model}"
    compute_count = "${var.compute_count}"

    customer_contacts {

        #Optional
        email = "${var.customer_contacts_email}"
    }


    data_safe_status = "${var.data_safe_status}"
   // data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
    data_storage_size_in_tbs = "${var.data_storage_size_in_tbs}"
    db_version = "${var.db_version}"
    db_workload = "${var.db_workload}"
    defined_tags = "${var.defined_tags}"
    display_name =  "${var.display_name}" != null ? "${var.display_name}" : "${var.db_name}"
    freeform_tags = "${var.freeform_tags}"
    is_access_control_enabled = "${var.is_access_control_enabled}"
    is_auto_scaling_enabled = "${var.is_auto_scaling_enabled}"
    is_data_guard_enabled = "${var.is_data_guard_enabled}"
    is_dedicated = "${var.is_dedicated}"
    is_free_tier = "${var.is_free_tier}"
    is_preview_version_with_service_terms_accepted = "${var.is_preview_version_with_service_terms_accepted}"
    //kms_key_id = "${var.kms_key_id}"
    license_model = "${var.license_model}"
    nsg_ids = "${var.atp_nsg_ids}"  != null ? "${var.atp_nsg_ids}" : ["${oci_core_network_security_group.atp_nsg.id}"]
    //ocpu_count = "${var.ocpu_count}"
    private_endpoint_label = "${var.private_endpoint_label}"
    refreshable_mode = "${var.refreshable_mode}"
    source = "${var.source_db}"
    source_id = "${var.source_id}"
    standby_whitelisted_ips = "${var.standby_whitelisted_ips}"
    //subnet_id = "${var.subnet_id}" 
    subnet_id = "${var.subnet_id}" != null ? "${var.subnet_id}" :  "${module.oci_atp_subnet.subnets.sn-patch-atp.id}"
    timestamp = "${var.timestamp}"
    //vault_id = "${var.vault_id}"
    whitelisted_ips = "${var.whitelisted_ips}"
}




resource "oci_data_safe_data_safe_private_endpoint" "main" {
    #Required
    count = "${var.data_safe_endpoint_enable}" ? 1 : 0
    compartment_id = "${var.compartment_id}"
    display_name = "${var.data_safe_display_name}" != null ?  "${var.data_safe_display_name}" : "${var.private_endpoint_label}"
    subnet_id = "${var.subnet_id}" != null ? "${var.subnet_id}" :  "${module.oci_atp_subnet.subnets.sn-patch-atp.id}"
    vcn_id = "${var.vcn_id}"

    #Optional
    description = "${var.description}"
    freeform_tags = "${var.data_safe_freeform_tags}" != null ? "${var.data_safe_freeform_tags}" : "${var.freeform_tags}"
    nsg_ids = "${var.data_safe_nsg_ids}" != null ? "${var.data_safe_nsg_ids}" : ["${oci_core_network_security_group.datasafe_nsg.id}"]
}