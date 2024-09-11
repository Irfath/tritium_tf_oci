data "oci_core_subnets" "sub" {
  compartment_id = var.compartment_id
    #Optional
    display_name = var.load_balancer_subnet_name
}

locals {
  SUBNETID = [
  #data.oci_core_subnets.sub.display_name
  for i in data.oci_core_subnets.sub.subnets : 
  i.display_name == var.load_balancer_subnet_name ? i.id : null
  ]
}


resource "oci_load_balancer_load_balancer" "cg_pub_load_balancer" {
    #Required
    compartment_id = var.compartment_id
    display_name = var.load_balancer_display_name
    shape = var.load_balancer_shape
    #subnet_ids = [element(local.SUBNETID, 0)]
    subnet_ids = var.publb_subnet_id
    #Optional
    # defined_tags = {"Operations.CostCenter"= "42"}
    # freeform_tags = {"Department"= "Finance"}
    # ip_mode = var.load_balancer_ip_mode
     is_private = var.load_balancer_is_private
    # network_security_group_ids = var.load_balancer_network_security_group_ids
    # reserved_ips {

    #     #Optional
    #     id = var.load_balancer_reserved_ips_id
    # }
    shape_details {
        #Required
        maximum_bandwidth_in_mbps = var.load_balancer_shape_details_maximum_bandwidth_in_mbps
        minimum_bandwidth_in_mbps = var.load_balancer_shape_details_minimum_bandwidth_in_mbps
    }
}