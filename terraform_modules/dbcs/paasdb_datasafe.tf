module "datasafe_registration"{

	source = "../datasafe"
	compartment_id=var.compartment_id
	db_subnet_id=module.my_primary_paas_db.db_subnet_id
	vcn_id= var.vcn_id
	ds_pvt_endpoint_desc = var.ds_pvt_endpoint_desc
	data_safe_display_name=var.data_safe_display_name
	# pvt_endpoint_nsg = module.my_primary_paas_db.pvt_endpoint_nsg_id

# pass id of db nsg id to module and creatre the egress rule	
#	dbcs_pvt_ip = var.primary_db_subnet_cidr_block
#	ds_pvt_ip= var.primary_db_subnet_cidr_block


	db_system_id=module.my_primary_paas_db.dbcs_system_id
#	db_service_name = var.db_service_name
	db_service_name = format("%s.%s",var.pdb_name,module.my_primary_paas_db.db_subnet_domain_name)
	ds_admin_password=var.ds_admin_password
	ds_admin_user=var.ds_admin_user

	target_database_desc=var.target_database_desc
    target_database_display_name=var.primary_db_system_name
	

}


