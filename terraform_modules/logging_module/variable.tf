variable "compartment_id"{
	type=string
}

variable "log_name"{
	type=string
}

variable "log_type"{
	type=string
	default="SERVICE"
}

variable "log_category"{
	type=string
}

variable "log_resource_id"{
	type=string
}

variable "log_service"{
	type=string
}

variable "log_source_type"{
	type=string
	default="OCISERVICE"
}

variable "is_log_enabled"{
	type=bool
	default=true
}

variable "log_retention_duration"{
	type=number
	default=30
}

variable "log_group_id"{
	type=string
}