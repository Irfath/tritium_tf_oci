
variable "oke_cluster_id" {
  description = "oke custer id"
  type        = string
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "node_pool_kubernetes_version" {
  description = "k8s node pool version"
  type        = string
}

variable "node_pool_name" {
  description = "k8s node pool name"
  type        = string
}

variable "node_pool_node_shape" {
  description = "k8s node shape"
  type        = string
}

variable "node_pool_subnet_ids" {
  description = "k8s node subnet ids"
  type        = string
}

variable "node_image_id" {
  description = "k8s node image id"
  type        = string
}

variable "node_pool_node_source_details_source_type" {
  description = "k8s node source"
  type        = string
  default     = "IMAGE"
}

variable "node_pool_ssh_public_key" {
  description = "k8s node ssh key"
  type        = string
}

/*
variable "availability_domains_id" {
  description = "k8s availablity domain ids"
  type        = string
} 
*/
variable "instance_count" {
  description = "k8s number of instances"
  type        = string
}

variable "node_pool_node_source_details_boot_volume_size_in_gbs" {
  description = "k8s node pool block volume"
  type        = string
}

variable "node_pool_instance_flex_memory_in_gbs" {
  type        = number
  description = "(Updatable) The total amount of memory available to the instance, in gigabytes."
  default     = null
}

variable "node_pool_instance_flex_ocpus" {
  type        = number
  description = "(Updatable) The total number of OCPUs available to the instance."
  default     = null
}

locals {
  shapes_config = {
    // prepare data with default values for flex shapes. Used to populate shape_config block with default values
    // Iterate through data.oci_core_shapes.ad1.shapes (this exclude duplicate data in multi-ad regions) and create a map { name = { memory_in_gbs = "xx"; ocpus = "xx" } }
    for i in data.oci_core_shapes.ad1.shapes : i.name => {
      "memory_in_gbs" = i.memory_in_gbs
      "ocpus"         = i.ocpus
    }
  }
  shape_is_flex = length(regexall("^*.Flex", var.node_pool_node_shape)) > 0 # evaluates to boolean true when var.shape contains .Flex
}

data "oci_core_shapes" "ad1" {
  compartment_id      = var.compartment_id
  availability_domain = local.ADs[0]
}

locals {
  ADs = [
    // Iterate through data.oci_identity_availability_domains.ad and create a list containing AD names
    for i in data.oci_identity_availability_domains.ad.availability_domains : i.name
  ]
}