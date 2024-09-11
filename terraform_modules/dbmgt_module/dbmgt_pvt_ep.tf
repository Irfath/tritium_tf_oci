resource "oci_database_management_db_management_private_endpoint" "dbmgt_pvt_ep" {
    compartment_id = var.compartment_id
    name = var.dbmgt_pvt_endpoint_name
    subnet_id = var.db_subnet_id

    description = var.dbmgt_pvt_endpoint_description
    #nsg_ids = [var.private_endpoint_nsg_ids]

    
}