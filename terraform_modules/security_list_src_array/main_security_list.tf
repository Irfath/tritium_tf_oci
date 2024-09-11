# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

######################
# Security List(s)
######################
# default values

locals {
  dsts      = var.dst
  dst_ports = var.dst_port

  # Nested loop over both lists, and flatten the result.
  egress_list = distinct(flatten([
    for dst in local.dsts : [
      for dst_port in local.dst_ports : {
        dst      = dst
        dst_port = dst_port
      }
    ]
  ]))


  srcs          = var.src
  ing_dst_ports = var.ing_dst_port

  # Nested loop over both lists, and flatten the result.
  ingress_list = distinct(flatten([
    for src in local.srcs : [
      for ing_dst_port in local.ing_dst_ports : {
        src          = src
        ing_dst_port = ing_dst_port
      }
    ]
  ]))
}

# resource definitions
resource "oci_core_security_list" "this" {

  compartment_id = var.default_compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.display_name
  #defined_tags   = var.defined_tags
  #freeform_tags         = var.security_lists[local.sec_list_keys[count.index]].freeform_tags != null ? var.security_lists[local.sec_list_keys[count.index]].freeform_tags : var.default_freeform_tags

  dynamic "egress_security_rules" {

    #for_each = { for entry in local.egress_list : "${entry.dst}.${entry.dst_port}" => entry }
    iterator = rule
    for_each = [for x in local.egress_list :
      {
        dst : x.dst
        dst_port : x.dst_port
    }]

    content {
      protocol         = "6"
      destination      = rule.value.dst
      destination_type = "CIDR_BLOCK"
      stateless        = false

      tcp_options {
        max = rule.value.dst_port
        min = rule.value.dst_port

      }
    }
  }

  dynamic "ingress_security_rules" {
    #for_each = { for entry in local.ingress_list : "${entry.src}.${entry.ing_dst_port}" => entry }
    iterator = rule
    for_each = [for x in local.ingress_list :
      {
        src : x.src
        ing_dst_port : x.ing_dst_port
    }]
    content {
      protocol    = "6"
      source      = rule.value.src
      source_type = "CIDR_BLOCK"
      stateless   = false

      tcp_options {
        max = rule.value.ing_dst_port
        min = rule.value.ing_dst_port
      }
    }
  }

}

