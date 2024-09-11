#flow logging for db subnet

module "subnet_logging"{

        source = "../logging"

        compartment_id = var.compartment_id
        log_resource_id = module.my_primary_paas_db.db_subnet_id
        log_name = var.log_name
        log_category=var.log_category
        log_service = var.log_service
}

