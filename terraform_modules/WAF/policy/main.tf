    locals {
    default_origin_opt = {
        label                = "default"
        custom_headers       = []
    }
    origin_keys         = keys(var.origins_map)
    }
resource "oci_waas_waas_policy" "main" {
  #Required
  compartment_id = "${var.compartment_id}"
  domain         = "${var.primary_domain}"

  #Optional
  additional_domains = "${var.additional_domains}"
  display_name       = "${var.policy_name}"

  
  origin_groups {
    label = "originGroups1" 

    origin_group {
      origin = "primary"
      weight = "1"
    }
  }
  
  origins {
    #Required
    label = "primary"
    uri   = var.origin_uri
    http_port  = "80"
    https_port = "443"
  }

  policy_config {
    #Optional
    certificate_id                = "${var.certificate_id}"
    is_https_enabled              = true
    is_https_forced               = true
  }

  waf_config {
    origin        = "primary"
    origin_groups = ["originGroups1"]
  }
}