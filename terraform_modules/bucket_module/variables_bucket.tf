variable "compartment_ocid" {
  description = "(Updatable) The OCID of the compartment where to create all resources"
  type        = string
}

variable "bucket_name" {
  type = string
}

variable "bucket_namespace" {
  type = string
}

variable "bucket_access_type" {
  type = string
  default = "NoPublicAccess"
}

variable "bucket_auto_tiering" {
  type = string
  default = "Disabled"
}

variable "bucket_metadata" {
  type = map(string)
  default = {}
}

variable "bucket_object_events_enabled" {
  type = bool
  default = false
}

variable "bucket_storage_tier" {
  type = string
  default = "Standard"
}

variable "retention_rule_display_name" {
  type = string
}

variable "retention_rule_duration_time_amount" {
  type = number
}

variable "retention_rule_duration_time_unit" {
  type = string
}

variable "retention_rule_time_rule_locked" {
  type = string
}

variable "bucket_versioning" {
  type = string
  default = "Disabled"
}
