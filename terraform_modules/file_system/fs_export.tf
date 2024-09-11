resource "oci_file_storage_export_set" "cg_export_set" {
    #Required
    #mount_target_id = oci_file_storage_mount_target.cg_mount_target.id
    mount_target_id = var.mount_target_id

    #Optional
    display_name = var.export_set_name
    max_fs_stat_bytes = 23843202333
    max_fs_stat_files = 223442
}


resource "oci_file_storage_export" "cg_export" {
    #Required
    export_set_id = oci_file_storage_export_set.cg_export_set.id
    file_system_id = oci_file_storage_file_system.cg_file_system.id
    path = var.export_path

    #Optional
    export_options {
        #Required
        source = var.export_export_options_source

        #Optional
        access = "READ_WRITE"
        anonymous_gid = 1500
        anonymous_uid = 1500
        identity_squash = "NONE"
        require_privileged_source_port = false
    }
}