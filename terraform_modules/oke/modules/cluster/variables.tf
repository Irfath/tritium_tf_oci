variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "kubernetes_version" {
  type = string
  #default = "v1.19.7" 
}

variable "cluster_name" {
  type = string 
}

variable "vcn_id" {
  type = string  
}
variable "public_endpoint_enabled" {
  type = bool
  default = false
}
variable "subnet_id" {
  type = string  
}

variable "pod_security_policy_enabled" {
  type = bool
  default = false
}

variable "service_lb_subnet_ids" {
  type = list(string)
}