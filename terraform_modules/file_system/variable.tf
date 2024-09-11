variable "compartment_id"{
    type=string
}

variable "file_system_display_name"{
    type=string
    default="test_filesystem"
}
variable "subnet_display_name"{
    type=string
}

variable "ad_number" {
    type = number
    default = 1  
}
/* variable "mount_target_display_name"{
    type=string
    default="test_mount_target"
} */

variable "mount_target_id"{
    type=string
    default=""
}
variable "export_set_name" {
    type = string
}

variable "export_path" {
    type = string
  
}
variable "export_export_options_source" {
    type = string
}