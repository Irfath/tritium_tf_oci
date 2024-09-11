#topic

variable "compartment_id"{
        type=string
}

variable "notification_topic_name"{
        type=string
}

variable "notification_topic_description" {
        type=string
        default= "notification topic"
}

#subscription

variable "subscription_endpoint"{
#       type=string
        type=list
}

variable "subscription_protocol"{
        type=string
        default="EMAIL"
}

variable "notification_id"{
        type=string
}

