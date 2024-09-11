## primary region vcn details



variable "vcn_id"{
	type=string
}

variable "sec_list_name" {
	type=string
}

variable "app_subnet_cidr"{
	type=string
	default="172.22.4.16/28"
}

variable "bastion_subnet_cidr"{
	type=string
	default="172.16.0.0/21"
	
}

variable "db_subnet_cidr_block" {
	type=string
}

variable "db_subnet_name" {
	type=string
}

variable "rt_name" {
	type=string
}

variable "route_description" {
	type=string
}

variable "db_port" {
	type=number
	default=1521
}


variable "db_subnet_dns_label"{
	type=string
	default="dbnet"
}


variable "nat_gateway_id"{
	type=string
}

variable "service_gateway_id"{
	type=string
}

# variable "codegen_vpn_drg_id"{
# 	type=string
# }



# variable "db_nsg_name"{
# 	type=string
# }

# variable "pvt_endpoint_nsg_name"{
# 	type=string
# }
