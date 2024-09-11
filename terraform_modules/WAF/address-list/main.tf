resource "oci_waas_address_list" "main" {
  #Required
  count          = "${var.create_address_list}" ? 1 : 0
  addresses      = "${var.addresses}"
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.name}"

  #To use defined_tags, set the values below to an existing tag namespace, refer to the identity example on how to create tag namespaces
  #defined_tags = {"example-tag-namespace-all.example-tag", "originalValue"}
  #defined_tags = "${var.defined_tags}"
  #freeform_tags  = "${var.freeform_tags}" 
}