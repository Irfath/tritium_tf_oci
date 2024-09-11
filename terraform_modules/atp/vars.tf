variable "compartment_id" {
  type = string
}

variable "db_name" {
    type = string
    description = "(required) name of the database"
}

variable "display_name" {
    type = string
    default = null
}

variable "admin_password" {
    type = string  
}

variable "are_primary_whitelisted_ips_used" {
  type = bool
  default = null
}

variable "autonomous_container_database_id" {
  type = string
  default = null
  description = "The Autonomous Container Database OCID"
}

variable "autonomous_database_backup_id" {
  type = string
  default = null
  description = "Required when source=BACKUP_FROM_ID) The OCID of the source Autonomous Database Backup that you will clone to create a new Autonomous Database."
}

variable "autonomous_database_id" {
  type = string
  default = null
  description = "Required when source=BACKUP_FROM_TIMESTAMP) The OCID of the source Autonomous Database that you will clone to create a new Autonomous Database."
}

variable "clone_type" {
  type = string
  default = null
  description = "Required when source=BACKUP_FROM_ID | BACKUP_FROM_TIMESTAMP | DATABASE) The Autonomous Database clone type"
}

variable "cpu_core_count" {
  type = string
  description = "The number of OCPU cores to be made available to the database."
}

variable "customer_contacts_email" {
  type = string
  description = "The email address of an Oracle Autonomous Database contact"
  default = null
}

variable "data_safe_status" {
  type = string
  description = "Status of the Data Safe registration for this Autonomous Database. Could be REGISTERED or NOT_REGISTERED."
  default = "REGISTERED"
}

/*
variable "data_storage_size_in_gb" {
  type = string
  description = "The quantity of data in the database, in gigabytes."
  default = null
}
*/
variable "data_storage_size_in_tbs" {
  type = string
  description = "The amount of storage that has been used, in terabytes."
  default = null
}

variable "db_version" {
  type = string
  description = "(Optional) (Updatable) A valid Oracle Database version for Autonomous Database.db_workload AJD and APEX are only supported for db_version 19c and above."
  default = "19c"
}

variable "db_workload" {
  type = string
  description = "The Autonomous Database workload type. Valid types are,  OLTP, DW, AJD, APEX" 
  default = "OLTP"
}

/*
variable "defined_tags" {
  type        = map(string)
  description = "The different defined tags that are applied to each object by default."
  default = {
    "channel_manager_tag_namesapce.Environment" = "Production"
    "channel_manager_tag_namesapce.Name"        = "Channel_Manager"
  }
}
*/

variable "defined_tags" {
  type        = map(string)
  description = "The different defined tags that are applied to each object by default."
  default = {
    "travelbooker_dev_patch_tag_namesapce.Environment" = "DEV_PATCH"
    "travelbooker_dev_patch_tag_namesapce.Name"        = "TRAVELBOOKER"
  }
}

variable "freeform_tags" {
  type        = map(string)
  description = "ach tag is a simple key-value pair with no predefined name, type, or namespace."
  default = {}
}


variable "data_safe_freeform_tags" {
  type        = map(string)
  description = "ach tag is a simple key-value pair with no predefined name, type, or namespace."
  default = {}  
}

variable "is_access_control_enabled" {
  type = bool
  default = null
}

variable "is_auto_scaling_enabled" {
  type = string
  description = "Indicates if auto scaling is enabled for the Autonomous Database CPU core count."
  default = null
}

variable "is_data_guard_enabled" {
  type = bool
  description = "Optional) (Updatable) Indicates whether the Autonomous Database has Data Guard enabled."
  default = false
}

variable "is_dedicated" {
  type = bool
  default = false
  description = "(Optional) True if the database is on dedicated Exadata infrastructure."
}

variable "is_free_tier" {
  type = bool
  description = "(Optional) (Updatable) Indicates if this is an Always Free resource. The default value is false. Note that Always Free Autonomous Databases have 1 CPU and 20GB of memory. For Always Free databases, memory and CPU cannot be scaled. When db_workload is AJD or APEX it cannot be true"
  default = false
}

variable "is_preview_version_with_service_terms_accepted" {
  type = string
  description = "(Optional) If set to TRUE, indicates that an Autonomous Database preview version is being provisioned, and that the preview version's terms of service have been accepted. Note that preview version software is only available for databases on shared Exadata infrastructure."
  default = false
}

/*
variable "kms_key_id" {
  type = string
  description = "(Optional) The OCID of the key container that is used as the master encryption key in database transparent data encryption (TDE) operations."
  default = null
}
*/

variable "license_model" {
  type = string
  description = "When using shared Exadata infrastructure, if a value is not specified, the system will supply the value of BRING_YOUR_OWN_LICENSE. It is a required field when db_workload is AJD and needs to be set to LICENSE_INCLUDED as AJD does not support default license_model value BRING_YOUR_OWN_LICENSE"
  default = "LICENSE_INCLUDED"
}

variable "atp_nsg_ids" {
  type = list(string)
  default = null
  description = " (Optional) (Updatable) A list of the OCIDs of the network security groups (NSGs) that this resource belongs to"
}

/*
variable "ocpu_count" {
  type = string
  description = "(Optional) (Updatable) The number of Fractional OCPU cores to be made available to the database."
  default = null
}
*/

variable "private_endpoint_label" {
  type = string
  description = "(Optional) (Updatable) The private endpoint label for the resource."
  default = null
}

variable "refreshable_mode" {
  type = string
  description = "(Applicable when source=CLONE_TO_REFRESHABLE) (Updatable) The refresh mode of the clone. AUTOMATIC indicates that the clone is automatically being refreshed with data from the source Autonomous Database."
  default = null
}

variable "source_db" {
  type = string
  description = "(Optional) The source of the database: Use NONE for creating a new Autonomous Database. Use DATABASE for creating a new Autonomous Database by cloning an existing Autonomous Database."
  default = "NONE"
}

variable "source_id" {
  type = string
  description = "(Required when source=CLONE_TO_REFRESHABLE | DATABASE) The OCID of the source Autonomous Database that you will clone to create a new Autonomous Database."
  default = null
}


variable "standby_whitelisted_ips" {
  type = list(string)
  description = "(Optional) (Updatable) The client IP access control list (ACL). This feature is available for autonomous databases on shared Exadata infrastructure and on Exadata Cloud@Customer. Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance."
  default = null
}

variable "subnet_id" {
  type = string
  description = "(Optional) (Updatable) The OCID of the subnet the resource is associated with."
  default = null
}

variable "timestamp" {
  type = string
  description = " (Required when source=BACKUP_FROM_TIMESTAMP) The timestamp specified for the point-in-time clone of the source Autonomous Database. The timestamp must be in the past."
  default = null
}

/*
variable "vault_id" {
    type = string
    description = "(Optional) The OCID of the Oracle Cloud Infrastructure vault."
    default = null
}
*/

variable "whitelisted_ips" {
    type = list(string)
    description = "Optional) (Updatable) The client IP access control list (ACL). This feature is available for autonomous databases on shared Exadata infrastructure and on Exadata Cloud@Customer. Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance."
    default = null
  
}

variable "data_safe_endpoint_enable" {
  type = bool
  default = false
}

variable "vcn_id" {
  type = string
  default = null
}

variable "data_safe_nsg_ids" {
  type = list(string)
  default = null
}

variable "description" {
  type = string
  default = null
}


variable "data_safe_display_name" {
    type = string
    default = null
}

















# Subnet-specific variables
variable "subnets" {
  type                = map(object({
    compartment_id    = string,
    defined_tags      = map(string),
    freeform_tags     = map(string),
    dynamic_cidr      = bool,
    cidr              = string,
    cidr_len          = number,
    cidr_num          = number,
    enable_dns        = bool,
    dns_label         = string,
    private           = bool,
    ad                = number,
    dhcp_options_id   = string,
    route_table_id    = string,
    security_list_ids = list(string)
  }))
  description         = "Parameters for each subnet to be created/managed."
  default             = {
    compartment_id    = null
    defined_tags      = null
    freeform_tags     = null
    dynamic_cidr      = null
    cidr              = null
    cidr_len          = null
    cidr_num          = null
    enable_dns        = null
    dns_label         = null
    private           = null
    ad                = null
    dhcp_options_id   = null
    route_table_id    = null
    security_list_ids = null
  }
}

variable "vcn_cidr" {
  type = string
}

variable "atp_nsg_name" {
  type = string
  default = "nsg-atp"
  
}

variable "ds_nsg_name" {
  type = string
  default = "nsg-datasafe"
  
}

variable "oke_subnet_cidr" {
  type = string

}

variable "app_subnet_2" {
    type = string
}



# ECPU Modification

variable "compute_model" {
  type=string
}

variable "compute_count" {
  type=string
}