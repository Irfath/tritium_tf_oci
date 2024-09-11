# primary security list

resource "oci_core_security_list" "security-list"{

# Required
  compartment_id = var.compartment_id

  vcn_id = var.vcn_id


# Optional
  display_name = var.sec_list_name
#https://docs.oracle.com/en-us/iaas/Content/Database/Tasks/network.htm#gen_sec_rules
egress_security_rules {
      stateless = false
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "6"
      description = "access to internet via nat gateway"
  }

#https://docs.oracle.com/en-us/iaas/Content/Database/Tasks/network.htm#cust_sec_list option 2
# egress_security_rules {
#       stateless = false
#       destination = data.oci_core_services.services.services.1.cidr_block
#       destination_type = "SERVICE_CIDR_BLOCK"
#       protocol = "6"
#       description = "access to service gateway"
#       tcp_options {
#           min = 443
#           max = 443
#       }
#   }

################# application subnet rules ######################

ingress_security_rules {
      stateless = false
      source = var.app_subnet_cidr
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      description = "access to DB from application subnet"
      tcp_options {
          min = var.db_port
          max = var.db_port
      }
    }

ingress_security_rules {
      stateless = false
      source = var.app_subnet_cidr
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      description = "ONS subscriptions from application subnet"
      tcp_options {
          min = 6200
          max = 6200
      }
    }

ingress_security_rules { 
      stateless = false
      source = var.app_subnet_cidr
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
      protocol = "1"
  
      # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
      icmp_options {
        type = 3
        code = 4
      } 
    }   
  
  ingress_security_rules { 
      stateless = false
      source = var.app_subnet_cidr
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
      protocol = "1"
  
      # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
      icmp_options {
        type = 3
      } 
    }

  ingress_security_rules {
      stateless = false
      source = var.app_subnet_cidr
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1
      protocol = "1"
      description = "respond to ping from local network"
	
      # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
      icmp_options {
        type = 8
      }
    }

####################### bastion rules #########################

ingress_security_rules {
      stateless = false
      source = var.bastion_subnet_cidr
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      description = "ssh access to DB VM from bastion subnet"
      tcp_options {
          min = 22
          max = 22
      }
    }

ingress_security_rules {
      stateless = false
      source = var.bastion_subnet_cidr
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      description = "EM express access from bastion subnet"
      tcp_options {
          min = 5500
          max = 5500
      }
    }

######################### data safe rules #########################

egress_security_rules {
      stateless = false
      destination = var.db_subnet_cidr_block
      destination_type = "CIDR_BLOCK"
      protocol = "6"
      description = "outbound access from DS to DBCS"
      tcp_options {
          min = var.db_port
          max = var.db_port
      }

  }



ingress_security_rules {
      stateless = false
      source = var.db_subnet_cidr_block
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      description = "inbound access to DBCS from DS"
      tcp_options {
          min = var.db_port
          max = var.db_port
      }
    }

######################### tf sync rules #########################
ingress_security_rules {
      stateless = false
      source = "10.141.9.0/24"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "vpn"
      tcp_options {
          min = 1521
          max = 1521
      }
    }
ingress_security_rules {
      stateless = false
      source = "172.16.0.0/21"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "vpn"
      tcp_options {
          min = 1521
          max = 1521
      }
    }
ingress_security_rules {
      stateless = false
      source = "192.168.0.0/21"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "vpn"
      tcp_options {
          min = 1521
          max = 1521
      }
    }

ingress_security_rules {
      stateless = false
      source = "192.168.0.0/21"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "VPN access"
      tcp_options {
          min = 22
          max = 22
      }
    }

ingress_security_rules {
      stateless = false
      source = "172.22.4.80/28"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "app1 to db"
      tcp_options {
          min = 1521
          max = 1521
      }
    }  
ingress_security_rules {
      stateless = false
      source = "172.22.4.112/28"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "app2 to db"
      tcp_options {
          min = 1521
          max = 1521
      }
    }
ingress_security_rules {
      stateless = false
      source = "172.22.4.144/29"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "ota to DB"
      tcp_options {
          min = 1521
          max = 1521
      }
    }
ingress_security_rules {
      stateless = false
      source = "172.22.4.32/28"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "web1 to db"
      tcp_options {
          min = 1521
          max = 1521
      }
    }
ingress_security_rules {
      stateless = false
      source = "172.22.4.80/28"
      source_type = "CIDR_BLOCK"
      protocol = "6"
      description = "web2 to db"
      tcp_options {
          min = 1521
          max = 1521
      }
    }                             

}




