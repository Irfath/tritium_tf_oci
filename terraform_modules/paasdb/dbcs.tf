resource "oci_database_db_system" "paas_dbcs" {
    #Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id

    db_home {
        #Required
        database {
            #Required
            admin_password = var.admin_password

            #Optional
            
            character_set = var.character_set
            
            db_backup_config {

                #Optional
                auto_backup_enabled = var.enable_auto_backup
                auto_backup_window = var.backup_window
                
                recovery_window_in_days = var.recovery_window
            }
            db_name = var.db_name
            db_workload = var.db_workload
            ncharacter_set = var.ncharacter_set
            pdb_name = var.pdb_name
            tde_wallet_password = var.wallet_password

        }

        #Optional

        db_version = var.db_version
        display_name = var.db_home_name
    }
    hostname = var.db_hostname
    shape = var.db_shape
    ssh_public_keys = var.public_key
    subnet_id = var.db_subnet_id

    #Optional
    data_storage_size_in_gb = var.data_storage_size_in_gb
    database_edition = var.database_edition
    db_system_options {

        #Optional
        storage_management = var.storage_management
    }
    
    domain = var.subnet_domain_name
    display_name = var.db_system_name    
    license_model = var.license_model

/*    maintenance_window_details {

        #Optional
        days_of_week {

            #Optional
            name = var.maintenance_day
        }

        hours_of_day = var.maintenance_slot
        lead_time_in_weeks = var.lead_time
        months {

            #Optional
            name = var.maintenance_months
        }
        preference = var.preference
        weeks_of_month = var.maintenance_weeks_of_month
    }
*/

    node_count = var.db_node_count    
    # nsg_ids = [oci_core_network_security_group.db_nsg.id]
    time_zone = var.time_zone


lifecycle {
      # Changes to following values will not result in DB_SYSTEM destroy/create actions
      # TODO XXX: Test and allow updatable changes below
      ignore_changes  = [
        availability_domain,
        backup_network_nsg_ids, #Updatable
        backup_subnet_id,
        cluster_name,
        # TODO XXX: Cannot be changed due to data source requiring compartment_id and failing when changed
        compartment_id, #Updatable
        data_storage_percentage,
        # data_storage_size_in_gb, #Updatable
        database_edition,
        db_home[0].database[0].admin_password,
	db_home[0].database[0].tde_wallet_password,
        db_home[0].database[0].backup_id,
        db_home[0].database[0].backup_tde_password,
        db_home[0].database[0].character_set,
#        db_home[0].database[0].db_backup_config[0].auto_backup_enabled, #Updatable
#        db_home[0].database[0].db_backup_config[0].auto_backup_window, #updatable
#        db_home[0].database[0].db_backup_config[0].recovery_window_in_days, #Updatable
        db_home[0].database[0].db_name,
        db_home[0].database[0].db_workload,
        db_home[0].database[0].ncharacter_set,
        db_home[0].database[0].pdb_name,
        db_home[0].db_version,
        db_home[0].display_name,
	# db_home[0].database[0].id,
	# db_home[0].id,
        disk_redundancy,
        display_name,
        domain,
        fault_domains,
        hostname,
        license_model,
        node_count,
        nsg_ids, #Updatable
        #shape, #Updatable
        cpu_core_count, #Updatable
        source,
        sparse_diskgroup,
        ssh_public_keys,
        subnet_id,
        time_zone,
	defined_tags,
	db_home[0].defined_tags,
	db_home[0].database[0].defined_tags]
      # Never destroy DB system
      #TODO XXX: Allow removal in final version
      prevent_destroy = true
    } 


}
