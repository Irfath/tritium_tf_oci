output "data_volume_id" {
	value = oci_core_volume.data_volume.id
}

output "fra_volume_id" {
        value = oci_core_volume.fra_volume.id
}

output "opt_volume_id" {
        value = oci_core_volume.opt_volume.id
}


output "backup_volume_id" {
        value = oci_core_volume.backup_volume.id
}

