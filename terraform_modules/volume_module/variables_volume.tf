variable "compartment_id"{
	type=string
}

#variable "display_name" {
#	type = string
#}

variable "data_size_in_gbs" {
	type = string
}

variable "data_vpus_per_gb" {
	type=string
}

variable "fra_size_in_gbs" {
        type = string
}

variable "fra_vpus_per_gb" {
        type=string
}

variable "opt_size_in_gbs" {
        type = string
}

variable "opt_vpus_per_gb" {
        type=string
}

variable "backup_size_in_gbs" {
        type = string
}

variable "backup_vpus_per_gb" {
        type=string
}

variable "instance_id" {
        type = string
}

# variable "data_volume_id" {
#         type = string
# }

# variable "fra_volume_id" {
#         type = string
# }

# variable "opt_volume_id" {
#         type = string
# }


# variable "backup_volume_id" {
#         type = string
# }

# variable "instance_id" {
#         type = string
# }
variable "host" {
        type = string
}
variable "user" {
        type = string
}
variable "instance_key" { 
        type = string
}