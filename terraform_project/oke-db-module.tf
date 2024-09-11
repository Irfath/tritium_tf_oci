module "oke_db_security_list" {
  source = "../terraform_modules/security_list"

  vcn_id                 = module.vcn.vcn_id
  default_compartment_id = var.default_compartment_id
  security_lists = {
    oke_db = {
      compartment_id = null
      defined_tags   = "${var.defined_tags}"
      freeform_tags  = null
      egress_rules = [
        
         {
          stateless   = false
          protocol    = "6"
          dst         = "0.0.0.0/0" //allow https egress to any destination
          description = "allow https egress to any destination"
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
          dst         = "0.0.0.0/0" //allow https egress to any destination
          description = "allow https egress to any destination"
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
          dst         = "0.0.0.0/0" //allow https egress to any destination
          description = "allow https egress to any destination"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 25
            max = 25
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "all"
          dst         = var.oke_db_subnet_cidr //Allow all egress within OKE subnet
          description = "Allow all egress within OKE subnet"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port    = null
          icmp_type   = null
          icmp_code   = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.mongo_subnet_cidr //allow oracle egress towards the db subnet
          description = "allow oracle egress towards the db subnet"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 27017
            max = 27017
          }
          icmp_type = null
          icmp_code = null
        },

        {
          stateless   = false
          protocol    = "6"
          dst         = var.jump_subnet_cidr //allow https egress to any destination
          description = "allow https egress to any destination"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 3306
            max = 3306
          }
          icmp_type = null
          icmp_code = null
        }

        
      ]
      ingress_rules = [
       
         
       {
          stateless   = false
          protocol    = "6"
          src         = var.jump_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
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
          src         = var.jump_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 6443
            max = 6443
          }
          icmp_type = null
          icmp_code = null
        },
         {
          stateless   = false
          protocol    = "6"
          src         = var.jump_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 8443
            max = 8443
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          src         = var.jump_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 3306
            max = 3306
          }
          icmp_type = null
          icmp_code = null
        },

        {
    stateless   = false
    protocol    = "all"
    src         = var.oke_db_subnet_cidr
    description = "Allow incoming traffic from CG-02"
    src_type    = "CIDR_BLOCK"
    src_port    = null
    dst_port = {
        min = null
        max = null
    }
    icmp_type = null
    icmp_code = null
    },
  
       {
          stateless   = false
          protocol    = "6"
          src         = var.publb_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
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
          src         = var.pvt_lb_db_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 31228
            max = 31228
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          src         = var.pvt_lb_db_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 31445
            max = 31445
          }
          icmp_type = null
          icmp_code = null
        },

        {
          stateless   = false
          protocol    = "6"
          src         = var.pvt_lb_db_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 30451
            max = 30451
          }
          icmp_type = null
          icmp_code = null
        },

        {
      stateless   = false
      protocol    = "all"
      src         = var.oke_db_subnet_cidr
      description = "Allow incoming traffic Private LB"
      src_type    = "CIDR_BLOCK"
      src_port    = null
      dst_port = {
        min = null
        max = null
      }
      icmp_type = null
      icmp_code = null
        }


    ]
    }
    pvt_lb_db = {
      compartment_id = null
      defined_tags   = "${var.defined_tags}"
      freeform_tags  = null
      egress_rules = [
        {
          stateless   = false
          protocol    = "6"
          dst         = "0.0.0.0/0" //allow https egress to any destination
          description = "allow https egress to any destination"
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
          dst         = "0.0.0.0/0" //allow https egress to any destination
          description = "allow https egress to any destination"
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
          dst         = var.oke_db_subnet_cidr //allow 32138 egress from OKE
          description = "allow 32138 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 32138
            max = 32138
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 32398 egress from OKE
          description = "allow 32398 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 32398
            max = 32398
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 10256
            max = 10256
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 31674
            max = 31674
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 31954
            max = 31954
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 32123
            max = 32123
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 32123
            max = 32123
          }
          icmp_type = null
          icmp_code = null
        },

      {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 31228
            max = 31228
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 31445
            max = 31445
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 30451
            max = 30451
          }
          icmp_type = null
          icmp_code = null
        },


        {
          stateless   = false
          protocol    = "6"
          dst         = var.jump_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 111
            max = 111
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "17"
          dst         = var.jump_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 111
            max = 111
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.jump_subnet_cidr //allow 10256 egress from OKE
          description = "allow 10256 egress from OKE"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 1521
            max = 1521
          }
          icmp_type = null
          icmp_code = null
        }


      ]
      ingress_rules = [
        {
          stateless   = false
          protocol    = "6"
          src         = var.publb_subnet_cidr //allow http traffic to Pub ALB subnet
          description = "allow http traffic to Pub ALB subnet"
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
          src         = var.publb_subnet_cidr //allow https traffic to Pub ALB subnet
          description = "allow https traffic to Pub ALB subnet"
          src_type    = "CIDR_BLOCK"
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
          src         = var.cg1_subnet_cidr //allow http traffic to Pub ALB subnet
          description = "allow http traffic to Pub ALB subnet"
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
          src         = var.cg1_subnet_cidr //allow https traffic to Pub ALB subnet
          description = "allow https traffic to  ALB subnet"
          src_type    = "CIDR_BLOCK"
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
          src         = var.cg2_subnet_cidr //allow http traffic to Pub ALB subnet
          description = "allow http traffic to ALB subnet"
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
          src         = var.cg2_subnet_cidr //allow https traffic to Pub ALB subnet
          description = "allow https traffic to  ALB subnet"
          src_type    = "CIDR_BLOCK"
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
          src         = "0.0.0.0/0" //allow http traffic to Pub ALB subnet
          description = "allow http traffic to Pub ALB subnet"
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
          src         = "0.0.0.0/0" //allow http traffic to Pub ALB subnet
          description = "allow http traffic to Pub ALB subnet"
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


module "oke_db_subnet" {
  source = "../terraform_modules/subnet"

  default_compartment_id = var.default_compartment_id
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id   = module.vcn.vcn_id
  vcn_cidr = var.vcn_cidr

  subnets = {
    sn_oke_db = {
      compartment_id = null
      #defined_tags      = "${var.defined_tags}"
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = var.oke_db_subnet_cidr
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "okedb"
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = "${module.vcn.nat_route_id}"
      security_list_ids = ["${module.oke_db_security_list.security_lists.oke_db.id}"]
    },
    sn_pvtlb_db = {
      compartment_id = null
      #defined_tags      = "${var.defined_tags}"
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = var.pvt_lb_db_subnet_cidr
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "pvtlbdb"
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = "${module.vcn.nat_route_id}"
      security_list_ids = ["${module.oke_db_security_list.security_lists.pvt_lb_db.id}"]
    }

  }
}


#OKE
module "oke_db" {
  source = "../terraform_modules/oke"

  compartment_id           = var.default_compartment_id
  cluster_name             = "${var.servername}-db-cluster" 
  vcn_id                   = module.vcn.vcn_id
  subnet_id                = module.oke_db_subnet.subnets.sn_oke_db.id
  service_lb_subnet_ids    = ["${module.oke_db_subnet.subnets.sn_pvtlb_db.id}"]
  node_pool_name           = "${var.project}-${var.environment}-db-node-pool"
  node_pool_node_shape     = "VM.Standard.E4.Flex"
  node_pool_instance_flex_memory_in_gbs = "24" 
  node_pool_instance_flex_ocpus         = "4"
  kubernetes_version       = "v1.29.1"
  node_pool_kubernetes_version= "v1.29.1"
  node_pool_subnet_ids     = module.oke_db_subnet.subnets.sn_oke_db.id
  instance_count           = "2"
  node_image_id            = var.oke_node_image_id
  boot_vol_size            = "100"
  node_pool_ssh_public_key = var.node-pool-db-autherized-key

}
