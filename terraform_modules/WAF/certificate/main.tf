resource "oci_waas_certificate" "main" {
  #Required
  count = var.create_certificate ? 1 : 0
  certificate_data = file("${var.certificate_path}")
  private_key_data = file("${var.private_key_path}")
  compartment_id   = "${var.compartment_id}"
  #Optional
  display_name                   = "${var.certificate_display_name}"
  is_trust_verification_disabled =  "${var.trust_verification_disabled}"
}