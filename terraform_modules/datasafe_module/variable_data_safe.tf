variable "compartment_id"{
	type=string
}

variable "data_safe_display_name"{
	type=string
}

variable "db_subnet_id"{
	type=string
}

variable "vcn_id"{
	type=string
}


variable "ds_pvt_endpoint_desc"{
	type=string
}

variable "db_port"{
	type=number
	default=1521
}

/*
variable "ds_sec_list_name"{
	type=string
}


variable "dbcs_pvt_ip"{
	type=string
}

variable "ds_pvt_ip"{
	type=string
}
*/

variable "target_database_type"{
	type=string
	default="DATABASE_CLOUD_SERVICE"
}


variable "database_infrastructure_type"{
	type=string
	default="ORACLE_CLOUD"
}

variable "db_system_id"{
	type=string
}

variable "db_service_name"{
	type=string
}

variable "ds_connection_type"{
	type=string
	default="PRIVATE_ENDPOINT"
}


variable "ds_admin_user"{
	type=string
	sensitive=true
}

variable "ds_admin_password"{
	type=string
	sensitive=true
}


variable "target_database_desc"{
	type=string
}


variable "target_database_display_name"{
	type=string
}

