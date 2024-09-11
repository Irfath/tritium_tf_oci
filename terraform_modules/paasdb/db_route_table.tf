resource "oci_core_route_table" "route_table" {

    #Required
    compartment_id = var.compartment_id
    vcn_id = var.vcn_id


    #Optional
    display_name = var.rt_name
    route_rules {
        #Required
        network_entity_id = var.nat_gateway_id

        #Optional
        description = "access to internet via nat gateway"
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }
   
  route_rules {
        #Required
        network_entity_id = var.service_gateway_id

        #Optional
        description = "access to regional service gateway"
	    destination = data.oci_core_services.services.services.0.cidr_block
        destination_type = "SERVICE_CIDR_BLOCK"

    }
    # route_rules {
    #     #Required
    #     network_entity_id = var.codegen_vpn_drg_id

    #     #Optional
    #     description = "codegen vpn LankaB"
    #     destination = "172.16.0.0/21"
    #     destination_type = "CIDR_BLOCK"
    # }    
    # route_rules {
    #     #Required
    #     network_entity_id = var.codegen_vpn_drg_id

    #     #Optional
    #     description = "codegen vpn SLT"
    #     destination = "192.168.0.0/21"
    #     destination_type = "CIDR_BLOCK"
    # }    
    


}

