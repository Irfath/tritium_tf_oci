resource "oci_kms_vault" "cg_vault" {
    #Required
    compartment_id = var.compartment_id
    display_name = var.vault_display_name
    vault_type = var.vault_vault_type

}