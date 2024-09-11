variable "compartment_id" {
	type = string
}

variable "shape" {
	type = string
}
variable "source_id" {
	type = string
	default = "ocid1.image.oc1.uk-london-1.aaaaaaaaznor73ldvqafb3f4iwymzfe4bepjjaygjmbf27xwm2wwlra4tola"
}

variable "db_subnet_id" {
	type = string
}

variable "memory_in_gbs" {
	type = string
}
        
variable "ocpus" {
	type= string
} 

variable "db_vm_display_name" {
	type = string
}

variable "pub_key_file" {
	type = string
}

variable "assign_public_ip" {
	type=string
	default=false
}

