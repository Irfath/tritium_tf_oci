output "custom_protection_rules" {
  value = {
    for i in oci_waas_custom_protection_rule.main:
      i.display_name => i
  }
}

output "rule_id" {
      value = oci_waas_custom_protection_rule.main[0].id
}