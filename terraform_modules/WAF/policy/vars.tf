variable origin_groups {
  type = map(object({
    label           = string,
    origin_group    = list(object({
      origin        = string,
      weight        = string
    }))
  }))
  description = "Parameters for customizing origin group(s)."
  default = {}
}





variable origins_map {
  type = map(object({
    label           = string,
    uri             = string,
    http_port       = string,
    https_port      = string,
    custom_headers    = list(object({
      name          = string,
      value         = string
    }))
  }))
  description = "Parameters for customizing origin(s)."
  default = {}
}


variable "compartment_id" {
  type = string
}

variable "primary_domain" {
  type = string
}

variable "additional_domains" {
  type = list(string)
  default = null
}
variable "origin_uri" {
  type =  string
}
variable "policy_name" {
  type = string
}

variable "certificate_id" {
  type = string
}

variable "custom_protection_rule_id" {
  type = string
  default = null
}

variable "address_list" {
  type = string
}

variable "is_response_text_check_enabled" {
  type = bool
  default = false
}

variable "expected_response_text" {
  type = string
  default = ""
}


