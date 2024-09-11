output "instance_id" {
	value = oci_core_instance.db_instance.id
}

output "private_ip" {
	value = oci_core_instance.db_instance.private_ip
}

output "public_ip" {
        value = oci_core_instance.db_instance.public_ip
}

