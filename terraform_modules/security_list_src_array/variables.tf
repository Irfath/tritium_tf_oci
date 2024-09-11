# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


variable "default_compartment_id" {
  type        = string
  description = "The default compartment OCID to use for resources (unless otherwise specified)."
}

variable "vcn_id" {
  type        = string
  description = "The VCN ID where the Security List(s) should be created."
}
/*
 variable "defined_tags" {
  type        = map(string)
  description = "The different defined tags that are applied to each object by default."
  default     = {}
}

variable "default_freeform_tags" {
  type        = map(string)
  description = "The different freeform tags that are applied to each object by default."
  default     = {}
} */


variable "display_name" {
  type = string 
}

variable "dst" {
  type = list
}

variable "dst_port" {
  type = list
}

variable "src" {
  type = list
}

variable "ing_dst_port" {
  type = list
}