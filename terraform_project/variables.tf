/*### read me ###
This is the main variable you need to update.
update the varaibles accordingly

*/
variable "project" {
  ### project name ###
  type    = string
  default = "tritium" 
}

variable "environment" {
  ### project environment ex- Prod, Stg, Uat ###
  type    = string
  default = "stg"

}

variable "servername" {
  ### project environment ex- Prod, Stg, Uat ###
  type    = string
  default = "trit-stg"

}


variable "default_compartment_id" {
  ### Oci compartment ID where you going to create the set up ##
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaazmnetkr35ljqy4o3k35dlvyowcmak3siy3s4q66wxikbmvajqrmq"
}

variable "defined_tags" {
  type        = map(string)
  description = "The different defined tags that are applied to each object by default."
  default = {
    "project_tag_namesapce.Environment" = "tritium"
    "project_tag_namesapce.Name"        = "stg"
  }
}

variable "freeform_tags1" {
  description = "simple key-value pairs to tag the resources created using freeform tags."
  type        = map(string)
  default = {
    "project_tag_namesapce.AccessControl" = "tritium_stg"
  }
}

variable "freeform_tags" {
  description = "simple key-value pairs to tag the resources created using freeform tags."
  type        = map(string)
  default = {
    "project_tag_namesapce.AccessControl" = "DG_OKE"
  }
}

variable "source_ocid" {
  ### This is the default image use to create VMs, please provide a latest image which availabe in the region ### 
  type    = string
  default = "ocid1.image.oc1.uk-london-1.aaaaaaaaebhu66xkmserrvecfa4cvxcfwkis7o5obbwlt46gfxuwsne6rjya"
}
variable "oke_node_image_id" {
   ### This is the default image use to create K8s nodes, please provide a latest image which availabe in the region ### 
   ### please note that most of the normal VM images are not supported as a OKE node ###
  type    = string
  default = "ocid1.image.oc1.uk-london-1.aaaaaaaa5rzn3mvwnhmhwgmbl4hjnecsljnsc2qflihavbhffksmre4ba4uq"
}
variable "db_bootvol_ocid" {
  type = string
  default = "ocid1.bootvolume.oc1.uk-london-1.abwgiljs2j4mwkmr6552kfe5pzbg57bcmu4c6dk4smj7i6hnguvqnpreta3q"
}


variable "vcn_cidr" {
  type    = string
  default = "172.22.182.0/23"
}

variable "db_port" {
  type    = number
  default = 1521
}

locals {
  nat_gateway_route_rules = [ # this is a local that can be used to pass routing information to vcn module for either route tables
    {
      destination      = var.cg1_subnet_cidr # Route Rule Destination CIDR
      destination_type = "CIDR_BLOCK"    # only CIDR_BLOCK is supported at the moment
      network_entity_id = "${module.vcn.drg_id}"            # for nat_gateway_route_rules input variable, you can use special strings "drg", "nat_gateway" or pass a valid OCID using string or any Named Values
      #network_entity_id = "${var.existing_drg_id}"
      description       = "Terraformed - User added Routing Rule: To drg created by this module. drg_id is automatically retrieved with keyword drg"
    },
    {
      destination      = var.cg2_subnet_cidr
      destination_type = "CIDR_BLOCK"
      network_entity_id = "${module.vcn.drg_id}"
      #network_entity_id = "${var.existing_drg_id}"
      description       = "Terraformed - User added Routing Rule: To drg with drg_id directly passed by user. Useful for gateways created outside of vcn module"
    }
    
  ]
}

# #PaasDB 

# variable "db_name" {
# 	default="stgdb"
# }

# variable "db_version" {
# 	default="19.10.0.0"
# }

# variable "database_edition" {
# 	default="ENTERPRISE_EDITION"
# #ENTERPRISE_EDITION_EXTREME_PERFORMANCE
# }


# variable "pdb_name" {
#         default="coststg"
# }


# variable "public_key" {
#         default =["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCPsyDWR9/mAdtReItTUXFqFK9/3GG94zwnDy/ZuyWG+pzvLPgcdE9scSvqF5lxIi++Au9AkaoJC/g/zY85RG6fBWGo9jUNVdo+PlJk+fN8Y7rNNm7s43W7Mdgmbq6OEVBPhG1ouvFsMjnBZgrBJ04S+nCcLbKhlW6BEUKcDgEQFz6twt3xXBSJx0YNzhadBGV/wk6EzdMXSf1u6A0Luk21Qe/32p4Nip1TUyTwFRMQmSc6eIxA88H+ECzLq3l2rldJ/y6QBDR9n8apZv6jn7NAuYC0IMH3SzzuGj/TmUWXpVdFywF9VBOl+KOc/v3AqkVyF1Ok/RBnnEpdfhhE5YYR computekey"]
# }

# variable "admin_password" {
# 	default="mCWPmhDk-8vcq3Hadr#"
# 	sensitive = true
# }

# variable "wallet_password" {
#         default="Dw6h28k6z-Dr8vBsKb#"
#         sensitive = true
# }

# variable "primary_db_shape" {
#         default = "VM.Standard2.4"
# }

# variable "primary_db_home_name" {
#         default="STGDBHome"
# }

# variable "primary_db_hostname" {
#         default="stgdbvm"
# }

# variable "primary_db_system_name"{
# 	default="STGDBSystem"
# }

#keys

/*
variable "ftp_authorized_keys_file" {
  type    = string
  default = "ssh-keys/ftp.pub"
}

variable "redis_authorized_keys_file" {
  type    = string
  default = "ssh-keys/redis.pub"
}


*/

variable "jump_ssh_authorized_keys_file" {
  type    = string
  default = "ssh-keys/jump.pub"
}

variable "mongodb_authorized_keys_file" {
  type    = string
  default = "ssh-keys/mongodb.pub"
}


variable "jenkins_authorized_keys_file" {
  type    = string
  default = "ssh-keys/jenkins.pub"
}

variable "db_authorized_keys_file" {
  type    = string
  default = "ssh-keys/db.pub"
}

variable "node-pool-autherized-key" {
  type    = string
  default = "ssh-keys/node-pool.pub"
}

variable "node-pool-db-autherized-key" {
  type    = string
  default = "ssh-keys/node-pool_db.pub"
}

variable "es_authorized_keys_file" {
  type    = string
  default = "ssh-keys/es.pub"
}

variable "log_authorized_keys_file" {
  type    = string
  default = "ssh-keys/log.pub"
}

variable "ftp_authorized_keys_file" {
  type    = string
  default = "ssh-keys/ftp.pub"
}

variable "build_authorized_keys_file" {
  type    = string
  default = "ssh-keys/build.pub"
}

variable "runner_authorized_keys_file" {
  type    = string
  default = "ssh-keys/runner.pub"
}


variable "common_subnet_cidr" {
  default = "172.22.183.160/29"
}

#SUBNET CIDRs
variable "jump_subnet_cidr" {
  default = "172.22.183.48/28"
}

variable "oke_subnet_cidr" {
  default = "172.22.182.128/25"
}

variable "oke_db_subnet_cidr" {
  default = "172.22.182.0/25"
}

variable "jenkins_subnet_cidr" {
  default = "172.22.183.128/28"
}

variable "mongo_subnet_cidr" {
  default = "172.22.183.64/28"
}


variable "es_subnet_cidr" {
  default = "172.22.183.80/28"
}

variable "log_subnet_cidr" {
  default = "172.22.183.96/28"
}

variable "redis_subnet_cidr" {
  default = "172.22.183.112/28"
}


variable "pvt_lb_db_subnet_cidr" {
  default = "172.22.183.0/28"
}

variable "pvt_lb_subnet_cidr" {
  default = "172.22.183.16/28"
}

variable "publb_subnet_cidr" {
  default = "172.22.183.32/28"
}

#API GATEWAY subnet
variable "apig_subnet_cidr" {
  default = "172.22.183.144/28"
}



/*
variable "primary_db_subnet_cidr_block" {
  default = "172.22.180.128/28"
}

variable "ftp_subnet_cidr" {
  default = "172.22.180.160/29"
}

*/


variable "cg1_subnet_cidr" {
  type    = string
  default = "172.16.0.0/21"
}
variable "cg2_subnet_cidr" {
  type    = string
  default = "192.168.0.0/21"
}

variable "cg_ad_cidr" {
  type    = string
  default = "192.168.0.5/32"
}

variable "subscription_endpoint"{
        type=list
        default= ["cloudops@codegen.net","support@codegen.net"]
}




## TO Allow port to OKE from Private lb subnet
variable "allowed_ports_oke_pvt_lb_subnet" {
  type = list(number)
  default = [ 80,443,30551,32123,32138,31674,32398,10256,31954,32393,31587,32736,31512,30840,30723,31725,30819,
31031,31060,32228,31664,30151,31459,31983,30105,31518,31790,32319,30372,31385,30806,30552,32038,
32010,32075,30700,30130,31450,32219,32081,31257,31823,30218,32260,31968 ]
}


#Bucket
variable "db_bucket_name" {
  default="db_transfer_bucket"
}


/*
### ATP ECPU
## ATP DATABASE CONFIGS
variable "database_version" {
  default="19c"
}

variable "database_name" {
  default="tbxbahmo"
}

variable "database_admin_password" {
  default="#ovJ;13L:;9ThblZ"
}

variable "db_storage_size" {
  #Database Storage size must be in TB (1TB)
  default="1"
}

variable "customer_contacts_email" {
  default="cloudops@codegen.net"
}


variable "compute_model" {
  default="ECPU"
}

variable "compute_count" {
  default = "4"
}
#if this is a ECPU - ATP cpu_core_count value must be null and cpu_core_count should be applied
variable "cpu_core_count" {
    # default = "1"
    default=null
}

###### ATP Database Configuration Over.

*/


/*

######### **  Database Matrics Alert Variables ** ####
#########################################################

variable "db_resource_name" {
  ####### -- Storage Utilization Alarm    Mentioned the DB SYstem Name here ##########
  type    = string
  default = "TBXBAHMO" 
}

variable "storage_alarm_body" {
  ####### -- Storage Utilization Alarm ##########
  type    = string
  default = "DB Storage Utilization has reached warning level on" 
}

variable "warning_storage_threshold" {
  # Warning alert threshold
  description = "Threshold value for storage warning"
  type        = number
  default     = 60
}

variable "critical_storage_threshold" {
  # critical alert threshold
  description = "Threshold value for storage critical"
  type        = number
  default     = 80
}

variable "critical_session_count_threshold" {
  # critical_session_count_threshold
  description = "Threshold value for session count Critical"
  type        = number
  default     = 280
}


variable "warning_session_count_threshold" {
  # critical_session_count_threshold
  description = "Threshold value for session count Warning"
  type        = number
  default     = 250
}

variable "critical_cpu_utilization_threshold" {
  # critical CPU Utilization _threshold Percentage 
  description = "Threshold value for CPU Utilization Critical"
  type        = number
  default     = 80
}

variable "warning_cpu_utilization_threshold" {
  # warning CPU Utilization _threshold Percentage 
  description = "Threshold value for CPU Utilization warning"
  type        = number
  default     = 70
}


variable "session_count_alarm_body" {
  ####### -- DB Session Count ##########
  type    = string
  default = "DB session count has reached Critical level on " 
}


variable "session_warning_count_alarm_body" {
  ####### -- DB Session Count ##########
  type    = string
  default = "DB session count has reached Warning level on " 
}

variable "cpu_utilization_alarm_body" {
  ####### -- DB Session Count ##########
  type    = string
  default = "DB CPU Utilization has reached Critical level on " 
}


variable "message_format" {
 # RAW - Raw JSON blob. Default value. 
 # PRETTY_JSON: JSON with new lines and indents
 # ONS_OPTIMIZED: Simplified, user-friendly layout
  type    = string
  default = "ONS_OPTIMIZED" 
}




##################*** Alaram Over *** ####################
##########################################################


*/



/*
###### WAAS Variables ##########

variable "waaf_address_list" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "private_key_path" {
  type = string
  default = "../ssl-cert/server.key"
}

variable "certificate_path" {
  type = string
  default = "../ssl-cert/STAR.codegen.net.crt"
}

*/