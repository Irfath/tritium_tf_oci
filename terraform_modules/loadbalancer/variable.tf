variable "compartment_id"{
	type=string
}
variable "publb_subnet_id"{
	type = list(string)
}

variable "load_balancer_display_name"{
	type=string
}

variable "load_balancer_shape"{
	type=string
    default = "flexible"
}

variable "load_balancer_subnet_name"{
	type=string
}
variable "load_balancer_shape_details_minimum_bandwidth_in_mbps"{
	type=number
    default = "10"
}
variable "load_balancer_shape_details_maximum_bandwidth_in_mbps"{
	type=number
    default = "100"
}

variable "load_balancer_is_private"{
	type=string
    default = "false"
}


