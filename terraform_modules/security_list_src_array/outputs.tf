# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.




#########################
## Security List(s)
#########################
/*
 output "security_lists" {
  description = "The security list(s) created/managed."
  value = {
    for i in oci_core_security_list.this:
      i.display_name => i
  }
} 
*/

output "security_list_id" {
  description = "security list id"
  value       = oci_core_security_list.this.id
}

/* 
output "nsgs" {
  description = "The Network Security Group(s) (NSGs) created/managed."
  value = {
    for i in oci_core_network_security_group.this:
      i.display_name => i
  }
}

output "nsg_rules" {
  description = "The NSG rules created/managed."
  value = flatten(
    concat(
      oci_core_network_security_group_security_rule.ingress_rules_other,
      oci_core_network_security_group_security_rule.ingress_rules_tcp_src_no_dst,
      oci_core_network_security_group_security_rule.ingress_rules_tcp_no_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_tcp_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_udp_src_no_dst,
      oci_core_network_security_group_security_rule.ingress_rules_udp_no_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_udp_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_icmp_type_no_code,
      oci_core_network_security_group_security_rule.ingress_rules_icmp_type_code,
      oci_core_network_security_group_security_rule.egress_rules_other,
      oci_core_network_security_group_security_rule.egress_rules_tcp_src_no_dst,
      oci_core_network_security_group_security_rule.egress_rules_tcp_no_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_tcp_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_udp_src_no_dst,
      oci_core_network_security_group_security_rule.egress_rules_udp_no_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_udp_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_icmp_type_no_code,
      oci_core_network_security_group_security_rule.egress_rules_icmp_type_code
    )
  )
}

output "nsg_ingress_rules" {
  description = "The ingress NSG rules created/managed."
  value = flatten(
    concat(
      oci_core_network_security_group_security_rule.ingress_rules_other,
      oci_core_network_security_group_security_rule.ingress_rules_tcp_src_no_dst,
      oci_core_network_security_group_security_rule.ingress_rules_tcp_no_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_tcp_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_udp_src_no_dst,
      oci_core_network_security_group_security_rule.ingress_rules_udp_no_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_udp_src_dst,
      oci_core_network_security_group_security_rule.ingress_rules_icmp_type_no_code,
      oci_core_network_security_group_security_rule.ingress_rules_icmp_type_code
    )
  )
}

output "nsg_egress_rules" {
  description = "The egress NSG rules created/managed."
  value = flatten(
    concat(
      oci_core_network_security_group_security_rule.egress_rules_other,
      oci_core_network_security_group_security_rule.egress_rules_tcp_src_no_dst,
      oci_core_network_security_group_security_rule.egress_rules_tcp_no_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_tcp_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_udp_src_no_dst,
      oci_core_network_security_group_security_rule.egress_rules_udp_no_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_udp_src_dst,
      oci_core_network_security_group_security_rule.egress_rules_icmp_type_no_code,
      oci_core_network_security_group_security_rule.egress_rules_icmp_type_code
    )
  )
} */
