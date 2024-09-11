module "log_group" {
  source = "../terraform_modules/log_group"

  compartment_id           = var.default_compartment_id
  log_group_display_name   = "${var.project}-${var.environment}-log-group"
}
