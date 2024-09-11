output "dbcs_system_id" {
	value = oci_database_db_system.paas_dbcs.id
}

output "dbcs_db_id" {
	value = data.oci_database_databases.paas_databases.databases[0].id
}

output "db_port" {
        value = oci_database_db_system.paas_dbcs.listener_port
}

output "dbcs_pvt_ip" {
        value = oci_database_db_system.paas_dbcs.private_ip
}

output "dbhome_id" {
	value=data.oci_database_db_homes.paas_db_homes.db_homes[0].id
}

output "dbcs_db_name" {
	value = data.oci_database_databases.paas_databases.databases[0].db_name
}

output "dbcs_db_unique_name" {
	value = data.oci_database_databases.paas_databases.databases[0].db_unique_name
}