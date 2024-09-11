variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
  # no default value, asking user to explicitly set this variable's value. see codingconventions.adoc
}

variable "cpe_ip_address" {
    description = "required"
    type = string
}

variable "cpe_display_name" {
    type = string
}

variable "freeform_tags" {
  #! Deprecation notice: will be renamed to freeform_tags at next major release
  description = "simple key-value pairs to tag the resources created using freeform tags."
  type        = map(string)
  default = {
    terraformed = "yes"
    module      = "vpn"
  }
}

variable "drg_id" {
    description = "required"
    type = string
}
variable "ip_sec_connection_static_routes" {
    description = "required"
    type = list(string)
}

variable "ip_sec_connection_display_name" {
    description = "required"
    type = string
}