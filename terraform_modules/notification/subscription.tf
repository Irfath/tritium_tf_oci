resource "oci_ons_subscription" "cg_subscription" {
    #Required
    compartment_id = var.compartment_id
    for_each = toset(var.subscription_endpoint)
    endpoint = each.value	  	
#    endpoint = var.subscription_endpoint
    protocol = var.subscription_protocol
    topic_id = var.notification_id

}
