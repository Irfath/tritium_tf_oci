module "notification" {
  source = "../terraform_modules/notification"

  compartment_id           = var.default_compartment_id
  notification_topic_name  = "${var.project}-${var.environment}-notification"
  subscription_endpoint    =  var.subscription_endpoint
  notification_id          = module.notification.notification_id
}

