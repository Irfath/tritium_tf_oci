module "redis_security_list" {
  source          = "../terraform_modules/security_list"

  vcn_id         = module.vcn.vcn_id 
  default_compartment_id  = var.default_compartment_id         
  security_lists = {
      redis = {
          compartment_id = null
          defined_tags   = "${var.defined_tags}"
          freeform_tags  = null
          egress_rules = [
               {
                    stateless = false
                    protocol  = "6"
                    dst       = "0.0.0.0/0" //allow https egress from to any destination
                    dst_type  = "CIDR_BLOCK"
                    src_port  = null
                    dst_port = {
                        min = 443
                        max = 443
                    }
                    icmp_type = null
                    icmp_code = null
                },
                {
                    stateless = false
                    protocol  = "6"
                    dst       = "0.0.0.0/0" //allow https egress from to any destination
                    dst_type  = "CIDR_BLOCK"
                    src_port  = null
                    dst_port = {
                        min = 80
                        max = 80
                  }
                    icmp_type = null
                    icmp_code = null
                },
                {
                    stateless = false
                    protocol  = "6"
                    dst       = var.redis_subnet_cidr//Allow Redis port to same subnet
                    dst_type  = "CIDR_BLOCK"
                    src_port  = null
                    dst_port = {
                        min = 6379
                        max = 6379
                  }
                    icmp_type = null
                    icmp_code = null
                },
        
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_subnet_cidr
          description = "Allow egress traffic to kubernetes API"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 6443
            max = 6443
          }
          icmp_type = null
          icmp_code = null
        }

          ]
          ingress_rules = [
           
            {
                stateless = false
                protocol  = "6"
                src       = var.oke_subnet_cidr //Allow Redis port to oke node pool
                src_type  = "CIDR_BLOCK"
                dst_port = {
                    min = 6379
                    max = 6379
                }
                src_port  = null
                icmp_type = null
                icmp_code = null
            },
            {
                stateless = false
                protocol  = "6"
                src       = var.redis_subnet_cidr //Allow Redis port to same subnet
                src_type  = "CIDR_BLOCK"
                dst_port = {
                    min = 6379
                    max = 6379
                }
                src_port  = null
                icmp_type = null
                icmp_code = null
            }

           
          ]
      }

  }
}

module "redis_subnet" {
  source          = "../terraform_modules/subnet"

  default_compartment_id  = var.default_compartment_id
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id                  = module.vcn.vcn_id
  vcn_cidr                = var.vcn_cidr
  
  subnets = {
    sn_redis = {
      compartment_id    = null
      #defined_tags      = "${var.defined_tags}"
      defined_tags      = null      
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = var.redis_subnet_cidr
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "redis"
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = "${module.vcn.nat_route_id}"
      security_list_ids = ["${module.redis_security_list.security_lists.redis.id}"]
    }
  }
}

