# ingress rule allowing data safe

resource "oci_core_network_security_group_security_rule" "dsNSGRule1" {

    #Required
    network_security_group_id = oci_core_network_security_group.datasafe_nsg.id
    direction = "EGRESS"
    protocol = "6"

    #Optional
    description = "Oracle Data Safe's private endpoint IP address, in atp subnet (from any port), can send requests to the database's private endpoint IP address, in atp subnet (on port 1522)"
    
    destination = oci_core_network_security_group.atp_nsg.id
    destination_type = "NETWORK_SECURITY_GROUP"
    stateless = "false"
    tcp_options {

        destination_port_range  {
            #Required
            max = "1522"
            min = "1522"
        }
    }
}



# ingress rule allowing data safe

resource "oci_core_network_security_group_security_rule" "atpNSGRule1" {

    #Required
    network_security_group_id = oci_core_network_security_group.atp_nsg.id
    direction = "INGRESS"
    protocol = "6"

    #Optional
    description = "The database's private endpoint IP address in atp subnet (on port 1522) can receive incoming traffic from Oracle Data Safe's private endpoint IP address, also in atp subnet (from any port) using NSG of each other"
    
    source = oci_core_network_security_group.datasafe_nsg.id
    source_type = "NETWORK_SECURITY_GROUP"
    stateless = "false"
    tcp_options {

        destination_port_range {
            #Required
            max = "1522"
            min = "1522"
        }
    }
}


# ingress rule allowing application traffic safe

resource "oci_core_network_security_group_security_rule" "atpNSGRule2" {

    #Required
    network_security_group_id = oci_core_network_security_group.atp_nsg.id
    direction = "INGRESS"
    protocol = "6"

    #Optional
    description = "incoming traffic from application subnet"

    source = "${var.oke_subnet_cidr}"
    source_type = "CIDR_BLOCK"
    stateless = "false"
    tcp_options {

        destination_port_range {
            #Required
            max = "1522"
            min = "1522"
        }
    }
}


resource "oci_core_network_security_group_security_rule" "atpNSGRule3" {

    #Required
    network_security_group_id = oci_core_network_security_group.atp_nsg.id
    direction = "INGRESS"
    protocol = "6"

    #Optional
    description = "incoming traffic from Jump subnet"

    source = "${var.app_subnet_2}"
    source_type = "CIDR_BLOCK"
    stateless = "false"
    tcp_options {

        destination_port_range {
            #Required
            max = "1522"
            min = "1522"
        }
    }
}



