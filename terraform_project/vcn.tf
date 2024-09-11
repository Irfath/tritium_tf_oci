module "vcn" {
  source = "../terraform_modules/vcn"

  
  # general oci parameters
  compartment_id = var.default_compartment_id
  label_prefix   = "${var.project}"

  # vcn parameters
  internet_gateway_enabled = true
  nat_gateway_enabled      = true
  service_gateway_enabled  = true
  create_drg               = true
  drg_display_name         = "${var.environment}-drg"
  attach_existing_drg      = false
  #existing_drg_id          = var.existing_drg_id
  #tags                     = var.tags
  vcn_cidrs                 = [var.vcn_cidr]
  vcn_dns_label            = "${var.environment}"
  vcn_name                 = "${var.environment}-vcn"
  lockdown_default_seclist = true

  //custom routing rules into nat gateway route table. 
  nat_gateway_route_rules      = local.nat_gateway_route_rules
}


