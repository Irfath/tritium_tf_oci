variable "create_address_list" {
  type = bool
  default = false
}


variable "addresses" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "compartment_id" {
  type = string
}
