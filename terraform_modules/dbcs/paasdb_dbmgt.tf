module "primary_paasdb_dbmgt" {
  
  source = "../dbmgt_module"
  
  # for dbmgt private endpoint
  compartment_id = var.compartment_id
  dbmgt_pvt_endpoint_description = var.dbmgt_pvt_endpoint_description
  dbmgt_pvt_endpoint_name = var.dbmgt_pvt_endpoint_name
  db_subnet_id = module.my_primary_paas_db.db_subnet_id
  # private_endpoint_nsg_ids = module.my_primary_paas_db.pvt_endpoint_nsg_id

  # enabling database mgt for db

  database_id = module.my_primary_paas_db.dbcs_db_id
  database_service_name =  format("%s.%s",module.my_primary_paas_db.dbcs_db_unique_name,module.my_primary_paas_db.db_subnet_domain_name)
  database_mgt_user_name = var.dbmgt_user_name
  password_secret_id = "ocid1.vaultsecret.oc1.eu-frankfurt-1.amaaaaaaj2m4spiagtl4grbigeeb7xkfmvs24j2k3qleqxe63zdv7os2rwsq"
  #enable_dbmgt = "false"


}