 /* from network module */

data "oci_core_nat_gateways" "cg_nat_gateways" {
 #Required
    compartment_id = var.compartment_id
}

data "oci_core_vcns" "cg_vcns" {
 #Required
    compartment_id = var.compartment_id
}


data "oci_core_service_gateways" "cg_service_gateways" {
    #Required
    compartment_id = var.compartment_id

}


module "my_primary_paas_db" {

	source = "../paasdb"

	compartment_id=var.compartment_id

	/* from network module */
/*	vcn_id=module.my_primary_vcn.vcn_id
#	vcn_cidr = module.my_primary_vcn.vcn_cidr
	nat_gateway_id=module.my_primary_vcn.nat_gateway_id
        service_gateway_id=module.my_primary_vcn.service_gateway_id
*/


	#vcn_id = data.oci_core_vcns.cg_vcns.virtual_networks[0].id
	vcn_id ="ocid1.vcn.oc1.eu-frankfurt-1.aaaaaaaa76ujjo2fpjdwa6hiboclsqkflmvrt5tp5ngh7atqv6da5rtonxkq"
    nat_gateway_id="ocid1.natgateway.oc1.eu-frankfurt-1.aaaaaaaar4d5ujgfxnxrigjjxzgpbs55koarumcsn3ei2cwi524axskuzjrq"
    service_gateway_id="ocid1.servicegateway.oc1.eu-frankfurt-1.aaaaaaaanoag3ez3ukzuni6aizsruyyh6kzi7nqhc43oeym3fdffxm525xya"

	/* db subnet config */

	db_subnet_cidr_block=var.primary_db_subnet_cidr_block
        db_subnet_name=var.primary_db_subnet_name
        db_subnet_dns_label = var.primary_db_subnet_dns_label

	sec_list_name=var.primary_sec_list_name
	# db_nsg_name=var.primary_db_nsg_name

 	app_subnet_cidr=var.app_subnet_cidr	
	bastion_subnet_cidr=var.bastion_subnet_cidr
	#codegen_vpn_drg_id=var.codegen_vpn_drg_id
	
	rt_name=var.primary_rt_name
	route_description = var.primary_route_description

	/* dbcs config */

	admin_password = var.admin_password
	#admin_password = base64decode(data.oci_secrets_secretbundle.admin-passwd.secret_bundle_content.0.content)
	#admin_password = base64decode(data.oci_vault_secrets.admin-passwd)	
	wallet_password = var.wallet_password

	db_subnet_id= module.my_primary_paas_db.db_subnet_id
	enable_auto_backup=true
	backup_window=var.backup_window
	db_name=var.db_name
	db_version=var.db_version
	db_shape=var.primary_db_shape
    database_edition=var.database_edition.EE
	db_home_name=var.primary_db_home_name
	pdb_name=var.pdb_name
	db_hostname=var.primary_db_hostname
	subnet_domain_name=module.my_primary_paas_db.db_subnet_domain_name
	public_key = var.public_key
	db_system_name = var.primary_db_system_name	
	time_zone=var.db_time_zone
	license_model=var.license_model.LINC
	storage_management = var.storage_management.ASM
	data_storage_size_in_gb=512

	# pvt_endpoint_nsg_name=var.primary_pvt_endpoint_nsg_name

}


