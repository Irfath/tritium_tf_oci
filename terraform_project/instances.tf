#jump/Bastian
module "jump_vm" {
  source = "../terraform_modules/compute-instance/"

  instance_count             = 1
  ad_number                  = 1
  compartment_ocid           = var.default_compartment_id
  instance_display_name      = "${var.servername}-jump"
  source_ocid                = var.source_ocid
  subnet_ocids               = ["${module.jump_subnet.subnets.sn_jump.id}"]
  assign_public_ip           = false
  ssh_authorized_keys        = var.jump_ssh_authorized_keys_file
  block_storage_sizes_in_gbs = [250]
  shape                      = "VM.Standard.E4.Flex"
  instance_flex_memory_in_gbs = "8" 
  instance_flex_ocpus         = "1"
  instance_availability_config_is_live_migration_preferred = true
  instance_availability_config_recovery_action= "RESTORE_INSTANCE"  
}




#Mongodb
module "mongodb-vm" {
  source = "../terraform_modules/compute-instance/"

  instance_count             = 1
  ad_number                  = 1
  compartment_ocid           = var.default_compartment_id
  instance_display_name      = "${var.servername}-mongodb"
  source_ocid                = var.source_ocid
  subnet_ocids               = ["${module.mongodb_subnet.subnets.sn_mongodb.id}"]
  assign_public_ip           = false
  ssh_authorized_keys        = var.mongodb_authorized_keys_file
  block_storage_sizes_in_gbs = [400]
  shape                      = "VM.Standard.E4.Flex"
  instance_flex_memory_in_gbs = "8" 
  instance_flex_ocpus         = "1"
  instance_availability_config_is_live_migration_preferred = true
  instance_availability_config_recovery_action= "RESTORE_INSTANCE"
}

#ES
module "es_vm" {
  source = "../terraform_modules/compute-instance/"

  instance_count             = 1
  ad_number                  = 1
  instance_fault_domain      = true // If true spread Vms on different Fault domains
  compartment_ocid           = var.default_compartment_id
  instance_display_name      = "${var.servername}-es"
  source_ocid                = var.source_ocid
  subnet_ocids               = ["${module.es_subnet.subnets.sn_es.id}"]
  assign_public_ip           = false
  ssh_authorized_keys        = var.es_authorized_keys_file
  block_storage_sizes_in_gbs = [250]
  shape                      = "VM.Standard.E4.Flex"
  instance_flex_memory_in_gbs = "8" 
  instance_flex_ocpus         = "2"
  instance_availability_config_is_live_migration_preferred = true
  instance_availability_config_recovery_action= "RESTORE_INSTANCE"  
}


#Jenkins
module "jenkins-instance" {
  source = "../terraform_modules/compute-instance/"

  instance_count             = 1
  ad_number                  = 1
  compartment_ocid           = var.default_compartment_id
  instance_display_name      = "${var.servername}-jenkins"
  source_ocid                = var.source_ocid
  subnet_ocids               = ["${module.jenkins_subnet.subnets.sn_jenkins.id}"]
  #subnet_ocids               = [module.jenkins_subnet.subnets.1.id]
  assign_public_ip           = false
  ssh_authorized_keys        = var.jenkins_authorized_keys_file
  block_storage_sizes_in_gbs = [250]
  shape                      = "VM.Standard.E4.Flex"
  instance_flex_memory_in_gbs = "8" 
  instance_flex_ocpus         = "1"
}

#Log
module "log-instance" {
  source = "../terraform_modules/compute-instance/"

  instance_count             = 1
  ad_number                  = 1
  compartment_ocid           = var.default_compartment_id
  instance_display_name      = "${var.servername}-log"
  source_ocid                = var.source_ocid
  subnet_ocids               = ["${module.log_subnet.subnets.sn_log.id}"] 
  assign_public_ip           = false
  ssh_authorized_keys        = var.log_authorized_keys_file
  block_storage_sizes_in_gbs = [100]
  shape                      = "VM.Standard.E4.Flex"
  instance_flex_memory_in_gbs = "8" 
  instance_flex_ocpus         = "2"
}




module "build_machine" {
  source = "../terraform_modules/compute-instance/"

  instance_count             = 1
  ad_number                  = 1
  compartment_ocid           = var.default_compartment_id
  instance_display_name      = "${var.servername}-build-machine"
  source_ocid                = var.source_ocid
  subnet_ocids               = ["${module.common_subnet.subnets.sn_common.id}"] 
  assign_public_ip           = false
  ssh_authorized_keys        = var.build_authorized_keys_file
  block_storage_sizes_in_gbs = [300]
  shape                      = "VM.Standard.E4.Flex"
  instance_flex_memory_in_gbs = "16" 
  instance_flex_ocpus         = "2"
}


module "runner_machine" {
  source = "../terraform_modules/compute-instance/"

  instance_count             = 1
  ad_number                  = 1
  compartment_ocid           = var.default_compartment_id
  instance_display_name      = "${var.servername}-runer"
  source_ocid                = var.source_ocid
  subnet_ocids               = ["${module.common_subnet.subnets.sn_common.id}"] 
  assign_public_ip           = false
  ssh_authorized_keys        = var.runner_authorized_keys_file
  block_storage_sizes_in_gbs = [300]
  shape                      = "VM.Standard.E4.Flex"
  instance_flex_memory_in_gbs = "24" 
  instance_flex_ocpus         = "3"
}
