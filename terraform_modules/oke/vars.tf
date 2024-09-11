//Cluster Variables

variable "compartment_id" {
  type = string
}

variable "vcn_id" {
  type = string
}

variable "subnet_id" {
  type = string
}
variable "service_lb_subnet_ids" {
    type = list(string)
}
variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string  
}
variable "node_pool_kubernetes_version" {
  type = string  
}


// Node pool Variables
variable "node_pool_name" {
  type = string
}
variable "node_pool_node_shape" {
  type = string
}
variable "node_pool_subnet_ids" {
  type = string
}
variable "instance_count" {
  type = string
}
variable "node_image_id" {
  type = string
}
variable "boot_vol_size" {
  type = string
}

variable "node_pool_ssh_public_key" {
  type = string
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