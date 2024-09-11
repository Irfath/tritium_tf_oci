data "oci_identity_availability_domains" "ad" {
    #Required
    compartment_id = var.compartment_id
}