resource "oci_core_instance" "db_instance" {

    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = var.shape
    source_details {
        source_id = var.source_id
        source_type = "image"
    }

   create_vnic_details {
        subnet_id = var.db_subnet_id
	assign_public_ip = var.assign_public_ip
    }


   shape_config {

        #Optional
        memory_in_gbs = var.memory_in_gbs
        ocpus = var.ocpus
    }
    # Optional
    display_name = var.db_vm_display_name
    
    metadata = {
        ssh_authorized_keys = file(var.pub_key_file)
    } 
    preserve_boot_volume = false
}
