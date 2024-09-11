data "oci_waas_protection_rules" "default_rules" {
	#Required
	waas_policy_id =  "${var.waas_policy_id}"

	#Optional
	#action = var.protection_rule_action
	#mod_security_rule_id = oci_events_rule.test_rule.id
}

locals {
  KEYs = [
    // Iterate through data.oci_identity_availability_domains.ad and create a list containing AD names
    for i in data.oci_waas_protection_rules.default_rules.protection_rules : i.key
  ]

}


resource "oci_waas_protection_rule" "main" {
  count          = length(var.keys)
  #count          = length(local.KEYs)
  waas_policy_id = "${var.waas_policy_id}"
  key            = "${var.keys[count.index]}"
  #key = element(local.KEYs, count.index)
  action         = "${var.action}"

  # exclusions {
  #   exclusions = "${var.exclusions}"
  #   target     = "${var.target}"
  # }
}