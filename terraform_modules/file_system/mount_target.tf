
# data "oci_identity_availability_domains" "ad" {
#   compartment_id = var.compartment_id
# }

# locals {
#   ADs = [
#     // Iterate through data.oci_identity_availability_domains.ad and create a list containing AD names
#     for i in data.oci_identity_availability_domains.ad.availability_domains : i.name
#   ]
# }

/* resource "oci_file_storage_mount_target" "cg_mount_target" {
    #Required
    availability_domain = element(local.ADs, var.ad_number - 1)
    compartment_id = var.compartment_id
    subnet_id = element(local.SUBNETID, 0)

    #Optional
   # defined_tags = {"Operations.CostCenter"= "42"}
    display_name = var.mount_target_display_name
    #freeform_tags = {"Department"= "Finance"}
    #hostname_label = var.mount_target_hostname_label
    #ip_address = var.mount_target_ip_address
    #nsg_ids = var.mount_target_nsg_ids
} */