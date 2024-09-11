
resource "oci_containerengine_node_pool" "main" {
    #Required
    cluster_id = var.oke_cluster_id
    compartment_id = var.compartment_id
    kubernetes_version = var.node_pool_kubernetes_version
    name = var.node_pool_name
    node_shape = var.node_pool_node_shape
    node_shape_config {
    // If shape name contains ".Flex" and instance_flex inputs are not null, use instance_flex inputs values for shape_config block
    // Else use values from data.oci_core_shapes.ad1 for var.shape
    memory_in_gbs = local.shape_is_flex == true && var.node_pool_instance_flex_memory_in_gbs != null ? var.node_pool_instance_flex_memory_in_gbs : local.shapes_config[var.node_pool_node_shape]["memory_in_gbs"]
    ocpus         = local.shape_is_flex == true && var.node_pool_instance_flex_ocpus != null ? var.node_pool_instance_flex_ocpus : local.shapes_config[var.node_pool_node_shape]["ocpus"]
  }
  
node_config_details {
    
    placement_configs {
        availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
        subnet_id = var.node_pool_subnet_ids
    }
    size = var.instance_count
    
}

    node_source_details {
        #Required
        image_id = var.node_image_id
        source_type = var.node_pool_node_source_details_source_type

        #Optional
        boot_volume_size_in_gbs = var.node_pool_node_source_details_boot_volume_size_in_gbs
    }

    ssh_public_key = file(var.node_pool_ssh_public_key)
}