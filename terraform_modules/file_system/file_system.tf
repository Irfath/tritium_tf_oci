
data "oci_identity_availability_domains" "ad" {
  compartment_id = var.compartment_id
}

data "oci_core_subnets" "sub" {
  compartment_id = var.compartment_id
    #Optional
    display_name = var.subnet_display_name
}

locals {
  ADs = [
    // Iterate through data.oci_identity_availability_domains.ad and create a list containing AD names
    for i in data.oci_identity_availability_domains.ad.availability_domains : i.name
  ]
  SUBNETID = [
  #data.oci_core_subnets.sub.display_name
  for i in data.oci_core_subnets.sub.subnets : 
  i.display_name == var.subnet_display_name ? i.id : null
  ]
}

resource "oci_file_storage_file_system" "cg_file_system" {
    #Required
    availability_domain = element(local.ADs, var.ad_number - 1)
    compartment_id = var.compartment_id

    #Optional
   # defined_tags = {"Operations.CostCenter"= "42"}
    display_name = var.file_system_display_name
    #freeform_tags = {"Department"= "Finance"}
    #kms_key_id = oci_kms_key.test_key.id
    #source_snapshot_id = oci_file_storage_snapshot.test_snapshot.id
}
