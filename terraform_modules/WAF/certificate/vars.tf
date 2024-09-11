variable "private_key_path" {
    type = string 
}

variable "certificate_path" {
  type = string
}

variable "certificate_display_name" {
  type = string
}

variable "trust_verification_disabled" {
  type = bool
  default = true
}

variable "compartment_id" {
  type = string
}

variable "create_certificate" {
  type = bool
  default = true
}