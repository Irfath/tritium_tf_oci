## primary region vcn details


variable "primary_sec_list_name" {
	default = "daUATSecList"
}

variable "primary_db_subnet_cidr_block" {
	default  = "172.22.4.152/29"
}

variable "primary_db_subnet_name" {
	default = "primaryUATDBSubnet"
}

variable "primary_db_subnet_dns_label" {
	default="uatdbnet"
}

variable "primary_db_home_name" {
        default="UATDBHome"
}

variable "primary_rt_name" {
        default="daUATRT"
}

variable "primary_route_description" {
       default="route table for routing traffic to internt"
}

variable "primary_db_hostname" {
        default="uatdbvm"
}


variable "primary_db_system_name"{
	default="UATDBSystem"
}


variable "primary_db_shape" {
        default = "VM.Standard2.2"
}

variable "backup_window" {
	default="SLOT_ONE"
}

variable "primary_db_nsg_name"{
	default="daonUAT_DB_NSG"
}

variable "primary_pvt_endpoint_nsg_name"{
	default="daUAT_PVT_EP_NSG"
}

variable "app_subnet_cidr"{
	type=string
	default="172.22.4.16/28"
}

variable "bastion_subnet_cidr"{
	type=string
	default="172.16.0.0/21"
	
}