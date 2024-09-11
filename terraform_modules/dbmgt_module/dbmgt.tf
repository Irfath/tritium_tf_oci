resource "oci_database_cloud_database_management" "dbcs_mgt" {
  
  database_id           = var.database_id
  management_type       = var.management_type.BASIC
  private_end_point_id  = oci_database_management_db_management_private_endpoint.dbmgt_pvt_ep.id 
  service_name          = var.database_service_name
  credentialdetails {
    user_name           = var.database_mgt_user_name
    password_secret_id  = var.password_secret_id
  }
  enable_management     = var.enable_dbmgt
}
