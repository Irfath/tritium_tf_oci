variable "data_storage_size_in_gb" {
	type=number
	default=256
}

variable "admin_password" {
	type=string
	sensitive = true
}

variable "wallet_password" {
        type=string
        sensitive = true
}


variable "character_set" {
	type=string
	default="AL32UTF8"
}

variable "ncharacter_set" {
	type=string
	default="AL16UTF16"
}

variable "enable_auto_backup" {
	type=bool
	default=true
}

variable "backup_window" {
	type=string
	default="SLOT_ONE"
}

variable "recovery_window" {
	type=number
	default=15
}

variable "db_name" {
	type=string
}

variable "db_workload" {
	type    = string
	default = "OLTP"
}

variable "db_version" {
	type    = string
}

variable "db_shape" {
	type    = string
}

variable "database_edition" {
	type    = string
}

variable "license_model" {
	type    = string
	default = "LICENSE_INCLUDED"
#BRING_YOUR_OWN_LICENSE
}

variable "db_node_count" {
	type    = number
	default = 1
}

variable "db_home_name" {
	type = string
}	

variable "db_system_name" {
	type=string
}

variable "pdb_name" {
	type = string
}

variable "db_hostname" {
	type = string
}

variable "subnet_domain_name" {
	type = string
}

variable "public_key" {
	type = list(string)
}

variable "db_subnet_id" {
	type=string
}

variable "preference" {
	type=string
	default="NO_PREFERENCE"
}

variable "storage_management" {
	type=string
	default="ASM"
}


variable "maintenance_day" {
	type=string
	default="SATURDAY"
}

variable "maintenance_slot" {
	type=list
	default=[0,1,2,3]
}

variable "lead_time" {
	type=number
	default=4
}

variable "maintenance_months" {
	type=string
	default="JANUARY"
}

variable "maintenance_weeks_of_month" {
	type=list
	default=[2]
}

variable "time_zone" {
	type=string
	default="UTC"
}
