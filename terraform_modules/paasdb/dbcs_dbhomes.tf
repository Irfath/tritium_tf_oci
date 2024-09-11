data "oci_database_db_homes" "paas_db_homes" {
    #Required
    compartment_id = var.compartment_id

    #Optional
    db_system_id = oci_database_db_system.paas_dbcs.id
}


