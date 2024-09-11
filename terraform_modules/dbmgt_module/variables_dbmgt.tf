variable "compartment_id" {
	type=string
}

variable "dbmgt_pvt_endpoint_name" {
	type=string
}

variable "db_subnet_id" {
	type=string
}

variable "dbmgt_pvt_endpoint_description" {
	type=string
}


# variable "private_endpoint_nsg_ids" {
# 	type=string
# }

variable "database_id" {
	type=string
}

variable "management_type" {
		type=map(string)
	default={
		ADVANCED="ADVANCED"
		BASIC="BASIC"
	}
}

variable "database_service_name" {
	type=string
}


variable "database_mgt_user_name" {
	type=string
	sensitive=true
}

variable "password_secret_id" {
	type=string
	sensitive=true
}

variable "enable_dbmgt" {
	type=string
	default=true
}
