variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
  # no default value, asking user to explicitly set this variable's value. see codingconventions.adoc
}

variable "dynamic_group_name" {
  type = string
  description = "The name you assign to the group during creation. The name must be unique across all compartments in the tenancy. "
  default = null
}

variable "dynamic_group_description" {
  type = string
  description = "The description you assign to the Group. Does not have to be unique, and it's changeable. "
  default     = null
}

variable "dynamic_group_matching_rule" {
  type = string
  description = "Define a matching rule or a set of matching rules to define the group members."
  default     = null
}