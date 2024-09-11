resource "oci_core_volume" "data_volume" {
    #Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id

     display_name = "data_volume"
#    is_auto_tune_enabled = var.volume_is_auto_tune_enabled
    size_in_gbs = var.data_size_in_gbs
    vpus_per_gb = var.data_vpus_per_gb
}

resource "oci_core_volume" "fra_volume" {
    #Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id

     display_name = "fra_volume"
#    is_auto_tune_enabled = var.volume_is_auto_tune_enabled
    size_in_gbs = var.fra_size_in_gbs
    vpus_per_gb = var.fra_vpus_per_gb
}

resource "oci_core_volume" "opt_volume" {
    #Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id

     display_name = "opt_volume"
#    is_auto_tune_enabled = var.volume_is_auto_tune_enabled
    size_in_gbs = var.opt_size_in_gbs
    vpus_per_gb = var.opt_vpus_per_gb
}

resource "oci_core_volume" "backup_volume" {
    #Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id

     display_name = "backup_volume"
#    is_auto_tune_enabled = var.volume_is_auto_tune_enabled
    size_in_gbs = var.backup_size_in_gbs
    vpus_per_gb = var.backup_vpus_per_gb
}

