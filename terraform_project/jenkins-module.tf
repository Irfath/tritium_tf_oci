module "jenkins_security_list" {
  source = "../terraform_modules/security_list"


  vcn_id                 = module.vcn.vcn_id
  default_compartment_id = var.default_compartment_id
  security_lists = {
    jenkins = {
      compartment_id = null
      defined_tags   = "${var.defined_tags}"
      freeform_tags  = null
      egress_rules = [
        {
          stateless   = false
          protocol    = "6"
          dst         = "0.0.0.0/0"
          description = "Allow egress http traffic to internet"
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
          dst         = "0.0.0.0/0"
          description = "Allow egress https traffic to internet"
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
          dst         = var.es_subnet_cidr
          description = "Allow egress ssh traffic to splunk subnet"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 22
            max = 22
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
        },
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_subnet_cidr
          description = "Allow egress ssh traffic to kubernetes API"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 22
            max = 22
          }
          icmp_type = null
          icmp_code = null
        }, 
        {
          stateless   = false
          protocol    = "6"
          dst         = var.oke_db_subnet_cidr
          description = "Allow egress traffic to kubernetes API"
          dst_type    = "CIDR_BLOCK"
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
          dst         = var.oke_db_subnet_cidr
          description = "Allow egress ssh traffic to kubernetes API"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 22
            max = 22
          }
          icmp_type = null
          icmp_code = null
        }, 


#AD Authentication Ports Below
# EGRESS >> 53,389,88,464,3268,135

        {
          stateless   = false
          protocol    = "6"
          dst         = var.cg_ad_cidr
          description = "TCP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 53
            max = 53
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "6"
          dst         = var.cg_ad_cidr
          description = "TCP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 389
            max = 389
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "6"
          dst         = var.cg_ad_cidr
          description = "TCP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 88
            max = 88
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "6"
          dst         = var.cg_ad_cidr
          description = "TCP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 464
            max = 464
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "6"
          dst         = var.cg_ad_cidr
          description = "TCP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 3268
            max = 3268
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "6"
          dst         = var.cg_ad_cidr
          description = "TCP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 135
            max = 135
          }
          icmp_type = null
          icmp_code = null
        },
				{
          stateless   = false
          protocol    = "17"
          dst         = var.cg_ad_cidr
          description = "UDP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 53
            max = 53
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "17"
          dst         = var.cg_ad_cidr
          description = "UDP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 389
            max = 389
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "17"
          dst         = var.cg_ad_cidr
          description = "UDP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 88
            max = 88
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "17"
          dst         = var.cg_ad_cidr
          description = "UDP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 464
            max = 464
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "17"
          dst         = var.cg_ad_cidr
          description = "UDP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 3268
            max = 3268
          }
          icmp_type = null
          icmp_code = null
        },
		    {
          stateless   = false
          protocol    = "17"
          dst         = var.cg_ad_cidr
          description = "UDP AD Ports for CG"
          dst_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 135
            max = 135
          }
          icmp_type = null
          icmp_code = null
        }
		
###AD Authentication Ports OVER EGRESS


      ]
      ingress_rules = [
        {
          stateless   = false
          protocol    = "6"
          src         = var.cg2_subnet_cidr
          description = "Allow incoming ssh traffic from CG-01"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 22
            max = 22
          }
          icmp_type = null
          icmp_code = null
        },
        {
          stateless   = false
          protocol    = "6"
          src         = var.cg1_subnet_cidr
          description = "Allow incoming ssh traffic from CG-02"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 22
            max = 22
          }
          icmp_type = null
          icmp_code = null
        },
         {
                stateless = false
                protocol  = "6"
                src       = var.jump_subnet_cidr //Allow ssh from jump subnet
                src_type  = "CIDR_BLOCK"
                dst_port = {
                    min = 22
                    max = 22
                }
                src_port  = null
                icmp_type = null
                icmp_code = null
        },


 ######AD Authintication Rules ingress ###
        {
          stateless   = false
          protocol    = "6"
          src         = var.cg_ad_cidr
          description = "TCP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 53
            max = 53
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "6"
          src         = var.cg_ad_cidr
          description = "TCP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 389
            max = 389
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "6"
          src         = var.cg_ad_cidr
          description = "TCP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 88
            max = 88
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "6"
          src         = var.cg_ad_cidr
          description = "TCP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 464
            max = 464
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "6"
          src         = var.cg_ad_cidr
          description = "TCP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 3268
            max = 3268
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "6"
          src         = var.cg_ad_cidr
          description = "TCP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 135
            max = 135
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "17"
          src         = var.cg_ad_cidr
          description = "UDP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 53
            max = 53
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "17"
          src         = var.cg_ad_cidr
          description = "UDP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 389
            max = 389
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "17"
          src         = var.cg_ad_cidr
          description = "UDP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 88
            max = 88
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "17"
          src         = var.cg_ad_cidr
          description = "UDP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 464
            max = 464
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "17"
          src         = var.cg_ad_cidr
          description = "UDP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 3268
            max = 3268
          }
          icmp_type = null
          icmp_code = null
        },
	      {
          stateless   = false
          protocol    = "17"
          src         = var.cg_ad_cidr
          description = "UDP AD ports enabled"
          src_type    = "CIDR_BLOCK"
          src_port    = null
          dst_port = {
            min = 135
            max = 135
          }
          icmp_type = null
          icmp_code = null
        }
        ############ AD Ingress Over


      ]
    }

  }
}



module "jenkins_subnet" {
  source = "../terraform_modules/subnet"

  default_compartment_id = var.default_compartment_id
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id   = module.vcn.vcn_id
  vcn_cidr = var.vcn_cidr

  subnets = {
    "sn_jenkins" = {
      compartment_id = null
      #defined_tags      = "${var.defined_tags}"
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = var.jenkins_subnet_cidr
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "jenkins"
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = "${module.vcn.nat_route_id}"
      security_list_ids = ["${module.jenkins_security_list.security_lists.jenkins.id}"]
    }
  }
}

