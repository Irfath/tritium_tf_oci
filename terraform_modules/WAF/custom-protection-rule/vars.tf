
variable "enabled" {
  type = bool
  default = false
}
variable "custom_rule_template" {
    type = string
    default = "SecRule REQUEST_URI / \"phase:2,   t:none,   capture,   msg:'Custom (XSS) Attack. Matched Data: %%%{TX.0}   found within %%%{MATCHED_VAR_NAME}: %%%{MATCHED_VAR}',   id:{{id_1}},   ctl:ruleEngine={{mode}},   tag:'Custom',   severity:'2'\"" 
}

variable "custom_rule_display_name" {
  type = string
}

variable "compartment_id" {
    type = string
}

# variable "description" {
#     type = string
#     default = null
# }

# variable "freeform_tags" {
#   type = map(string)
#   default = null
# }