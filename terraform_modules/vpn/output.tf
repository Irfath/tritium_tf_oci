output "cpe_dvice_shapes" {
    description = "The list of cpe_device_shapes"
    value = { for k, v in data.oci_core_cpe_device_shapes.main_device_shapes  : k => v }
}