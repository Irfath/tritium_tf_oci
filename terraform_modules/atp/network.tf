module "oci_atp_subnet" {
  source = "github.com/oracle-terraform-modules/terraform-oci-tdf-subnet.git"


  default_compartment_id = "${var.compartment_id}"
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id   = "${var.vcn_id}"
  vcn_cidr = "${var.vcn_cidr}" 

  subnets = "${var.subnets}" 
}


resource "oci_core_network_security_group" "atp_nsg" {

    #Required
    compartment_id = "${var.compartment_id}"
    vcn_id = "${var.vcn_id}"

    #Optional
    display_name = var.atp_nsg_name
    freeform_tags = "${var.freeform_tags}"
}


resource "oci_core_network_security_group" "datasafe_nsg" {

    #Required
    compartment_id = "${var.compartment_id}"
    vcn_id = "${var.vcn_id}"

    #Optional
    display_name = var.ds_nsg_name
    freeform_tags = "${var.freeform_tags}"
}

