module "cluster" {

    source = "./modules/cluster"

    compartment_id = var.compartment_id
    #kubernetes_version = var.kubernetes_version
    cluster_name = var.cluster_name
    vcn_id = var.vcn_id
    subnet_id = var.subnet_id
    service_lb_subnet_ids = var.service_lb_subnet_ids
    kubernetes_version = var.kubernetes_version
}





module "node-pool" {
    source = "./modules/node-pool"

    oke_cluster_id = "${module.cluster.cluster_id}"
    compartment_id = var.compartment_id
    #node_pool_kubernetes_version = var.node_pool_kubernetes_version
    node_pool_name = var.node_pool_name
    node_pool_node_shape = var.node_pool_node_shape
    node_pool_subnet_ids = var.node_pool_subnet_ids
    instance_count = var.instance_count
    node_image_id = var.node_image_id
    node_pool_node_source_details_boot_volume_size_in_gbs = var.boot_vol_size
    node_pool_ssh_public_key = var.node_pool_ssh_public_key
    node_pool_kubernetes_version = var.node_pool_kubernetes_version
    node_pool_instance_flex_memory_in_gbs = var.node_pool_instance_flex_memory_in_gbs
    node_pool_instance_flex_ocpus = var.node_pool_instance_flex_ocpus    
}