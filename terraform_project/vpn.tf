module "vpn" {
  source                          = "../terraform_modules/vpn"
  cpe_ip_address                  = "203.115.26.139"
  cpe_display_name                = "tritium-stg-cpe"
  compartment_id                  = var.default_compartment_id
  drg_id                          = module.vcn.drg_all_attributes.0.id
  ip_sec_connection_static_routes = ["192.168.0.0/21", "172.16.0.0/21"]
  ip_sec_connection_display_name  = "tritium-stg-vpn"
}