resource "oci_waas_http_redirect" "main" {
  #Required
  compartment_id = var.compartment_ocid
  domain         = var.domain

  target {
    #Required
    host     = var.target_domain
    path     = "/"
    protocol = "HTTP"
    query    = ""

    #Optional
    port = "80"
  }

  #Optional
  display_name = var.http_redirection_display_name

  # freeform_tags = {
  #   "Department" = "Finance"
  # }

  response_code = 301
}