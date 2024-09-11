variable "cpu_warn_low" {
    type=number
    default=70
}

variable "cpu_warn_high"{
    type=number
    default =79
}

variable "storage_warn_low" {
    type=number
    default=67
}

variable "storage_warn_high"{
    type=number
    default =77
}

variable "sessions_warn_low" {
    type=number
    default=1800
}

variable "sessions_warn_high"{
    type=number
    default =1999
}

variable "cpu_critical" {
    type=number
    default=80
}

variable "storage_critical" {
    type=number
    default=78
}

variable "session_critical" {
    type=number
    default=2000
}

variable "topic_id"{
    type=string
}

variable "database_id"{
    type=string
}

variable "cpu_alarm"{
    type=bool
    default=false
}

variable "storage_alarm"{
    type=bool
    default=false
}

variable "session_alarm"{
    type=bool
    default=false
}

variable "cpu_warn_pending_duration"{
    type=string
    default="PT5M"
}

variable "cpu_critical_pending_duration"{
    type=string
    default="PT1M"
}

variable "session_warn_pending_duration"{
    type=string
    default="PT5M"
}

variable "session_critical_pending_duration"{
    type=string
    default="PT1M"
}

variable "storage_warn_pending_duration"{
    type=string
    default="PT5M"
}

variable "storage_critical_pending_duration"{
    type=string
    default="PT5M"
}

variable "cpu_warn_repeat_notification_interval"{
    type=string
    default="PT10M"
}

variable "cpu_critical_repeat_notification_interval"{
    type=string
    default="PT2M"
}

variable "storage_warn_repeat_notification_interval"{
    type=string
    default="PT24H"
}

variable "storage_critical_repeat_notification_interval"{
    type=string
    default="PT24H"
}

variable "session_warn_repeat_notification_interval"{
    type=string
    default="PT10M"
}

variable "session_critical_repeat_notification_interval"{
    type=string
    default="PT2M"
}

variable "cpu_warn_display_name"{
    type=string
    default = "CPU Utilization Alarm - Warning"
}

variable "cpu_critical_display_name"{
    type=string
    default = "CPU Utilization Alarm - Critical"
}

variable "storage_warn_display_name"{
    type=string
    default = "Storage Utilization Alarm - Warning"
}

variable "storage_critical_display_name"{
    type=string
    default = "Storage Utilization Alarm - Critical"
}

variable "session_warn_display_name"{
    type=string
    default = "Session Count Alarm - Warning"
}

variable "session_critical_display_name"{
    type=string
    default = "Session Count Alarm - Critical"
}

variable "compartment_id"{
	type=string
}
