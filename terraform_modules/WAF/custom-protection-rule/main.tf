resource "oci_waas_custom_protection_rule" "main" {
  count          = "${var.enabled }" ? 1 : 0
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.custom_rule_display_name}"
  template       = "${var.custom_rule_template}"

  #Optional
  #To use defined_tags, set the values below to an existing tag namespace, refer to the identity example on how to create tag namespaces
  #defined_tags = {"example-tag-namespace-all.example-tag", "originalValue"}
  #description    = "${var.description}" 
  #freeform_tags  = "${var.freeform_tags}" 
}