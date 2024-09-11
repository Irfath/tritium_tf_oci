module "public_lb_security_list" {
  source = "../terraform_modules/security_list"


  vcn_id                 = module.vcn.vcn_id
  default_compartment_id = var.default_compartment_id
  security_lists = {
    publb = {
      compartment_id = null
      defined_tags   = "${var.defined_tags}"
      freeform_tags  = null
      egress_rules = [
        {
          stateless   = false
          protocol    = "6"
          dst         = var.pvt_lb_subnet_cidr
          description = "Allow egress http traffic to private lb"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 80
            max = 80
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.pvt_lb_subnet_cidr
          description = "Allow egress http traffic to private lb"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 443
            max = 443
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.pvt_lb_db_subnet_cidr
          description = "Allow egress http traffic to private lb"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 80
            max = 80
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.pvt_lb_db_subnet_cidr
          description = "Allow egress http traffic to private lb"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 443
            max = 443
          }
          icmp_type = null
          icmp_code = null
        }
      ]
      ingress_rules = [
        {
          stateless   = false
          protocol    = "6"
          src         = "0.0.0.0/0"
          description = "Allow ingress http traffic to internet"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 80
            max = 80
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          src         = "0.0.0.0/0"
          description = "Allow ingress https traffic to internet"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 443
            max = 443
          }
          icmp_type = null
          icmp_code = null
        }
      ]
    }

  }
}



module "publb_subnet" {
  source = "../terraform_modules/subnet"

  default_compartment_id = var.default_compartment_id
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id   = module.vcn.vcn_id
  vcn_cidr = var.vcn_cidr

  subnets = {
    "sn_publb" = {
      compartment_id = null
      #defined_tags      = "${var.defined_tags}"
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = var.publb_subnet_cidr
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "publb"
      private           = false
      ad                = null
      dhcp_options_id   = null
      route_table_id    = "${module.vcn.ig_route_id}"
      security_list_ids = ["${module.public_lb_security_list.security_lists.publb.id}"]
    }
  }
}

module "public_lb" {
    source = "../terraform_modules/loadbalancer"
  compartment_id = var.default_compartment_id
  load_balancer_display_name = "${var.project}-${var.environment}-pub-lb"
  load_balancer_subnet_name = "sn_publb"
  publb_subnet_id = ["${module.publb_subnet.subnets.sn_publb.id}"]
}