variable "enabled" {
  type = bool
  default = true
}

variable "waas_policy_id" {
  type = string
}

variable "keys" {
  type = list
  default = ["933161"]
}

variable "action" {
    type = string
    default = "BLOCK"
}

variable "exclusions" {
  type = list(any)
  default = null
}

variable "target" {
  type = string
  default = null
}