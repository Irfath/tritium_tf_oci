variable "compartment_id"{
    type=string
}

variable "ad_number" {
    type = number
    default = 1  
}
variable "mount_target_display_name"{
    type=string
    default="test_mount_target"
}

variable "subnet_display_name"{
    type=string
}