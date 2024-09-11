resource "oci_core_subnet" "db-subnet"{

  # Required
  compartment_id = var.compartment_id
  vcn_id = var.vcn_id  

  cidr_block = var.db_subnet_cidr_block
 
  route_table_id = oci_core_route_table.route_table.id
  #route_table_id = "ocid1.routetable.oc1.eu-frankfurt-1.aaaaaaaad2xwh6hkydjf5qzi425cjb2hssnzxeenspbflur3vlgflieczqca"
  security_list_ids = [oci_core_security_list.security-list.id]
  display_name = var.db_subnet_name
  prohibit_public_ip_on_vnic = true
  dns_label = var.db_subnet_dns_label
}

