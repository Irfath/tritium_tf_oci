variable "ds_pvt_endpoint_desc"{
	default="data safe registartion for da uat dbcs"
}

variable "data_safe_display_name"{
	default="da_uat_ds_pvt_ip"
}

variable "ds_sec_list_name"{
	default="da_datasfae_sec_list"
}

/*
variable "dbcs_pvt_ip"{
	default="10.10.0.51/32" #dbcs ip in cidr format
}

variable "ds_pvt_ip"{
	default="10.10.0.120/32" #ds ip in cidr format
}


variable "db_service_name"{
	default="coststaging.stagingdbnet.londonstagingdns.oraclevcn.com"
}
*/

variable "ds_admin_password"{
	default="bqx_WEB6014_CP"
	#default="qso%PRC432#Qx"
	sensitive=true
}

variable "ds_admin_user"{
	#default="DSADMIN"
	default="C##CGAUDITADMIN"
	sensitive=true
}

variable "target_database_desc"{
	default="da uat DS registered database"
}

variable "ds_nsg_name"{
	default="daUAT_DS_NSG"
}
