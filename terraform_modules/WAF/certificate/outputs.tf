output "certs" {
  value = {
    for i in oci_waas_certificate.main:
      i.display_name => i
  }
}

output "id" {
    description = "The list of cpe_device_shapes"
    value = oci_waas_certificate.main[0].id
}