data "oci_database_databases" "paas_databases" {
    #Required
    compartment_id = var.compartment_id

    #Optional
#    db_name = var.db_name
    system_id = oci_database_db_system.paas_dbcs.id
    db_home_id=data.oci_database_db_homes.paas_db_homes.db_homes[0].id
}


