output "db_subnet_id" {
	value = oci_core_subnet.db-subnet.id
}

output "db_sec_list_id" {
        value = oci_core_security_list.security-list.id
}

output "db_subnet_domain_name" {
	value = oci_core_subnet.db-subnet.subnet_domain_name
}

output "db_route_table_id"{
	value=oci_core_route_table.route_table.id
}

output "db_subnet_cidr"{
	value=oci_core_subnet.db-subnet.cidr_block
}

# output "db_nsg_id"{
# 	value = oci_core_network_security_group.db_nsg.id
# }

# output "pvt_endpoint_nsg_id"{
#         value = oci_core_network_security_group.pvt_endpoint_nsg.id
# }

