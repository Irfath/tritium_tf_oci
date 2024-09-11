#########
#notification

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "default_defined_tags" {
  type        = map(string)
  description = "Default defined tags for the OCI monitoring alarm."
  default     = null
}

variable "default_freeform_tags" {
  type        = map(string)
  description = "Default freeform tags for the OCI monitoring alarm."
  default     = null
}


variable "defined_tags" {
  description = "predefined and scoped to a namespace to tag the resources created using defined tags."
  type        = map(string)
  default     = null
}





variable "destinations" {
  description = "The unique identifiers (OCIDs) of the desination notification."
  type        = list(string)
}

variable "topic_id"{
    type        = list(string)
}



variable "compartment_ocid" {
  description = "(Updatable) The OCID of the compartment where to create all resources"
  type        = string
}


variable "alarm_display_name" {
  type = string
}

variable "alarm_is_enabled" {
  type    = bool
  default = true
}

variable "alarm_metric_compartment_id" {
  type = string
}

variable "alarm_namespace" {
  type = string
}

variable "alarm_query" {
  type = string
}

variable "alarm_severity" {
  type = string
}

variable "alarm_body" {
  type    = string
  default = ""
}

variable "alarm_is_notifications_per_metric_dimension_enabled" {
  type    = bool
  default = false
}

variable "alarm_message_format" {
  type    = string
  default = ""
}

variable "alarm_metric_compartment_id_in_subtree" {
  type    = bool
  default = false
}

variable "alarm_pending_duration" {
  type    = string
  default = "PT5M" # Default is 30 minutes
}

variable "alarm_repeat_notification_duration" {
  type    = string
  default = "PT10M" # Default is 1 hour
}

variable "alarm_resolution" {
  type    = string
  default = "1m" # Default resolution is 1 minute
}

variable "alarm_resource_group" {
  type    = string
  default = ""
}

variable "alarm_suppression_time_suppress_from" {
  type = string
}

variable "alarm_suppression_time_suppress_until" {
  type = string
}

variable "alarm_suppression_description" {
  type    = string
  default = ""
}
