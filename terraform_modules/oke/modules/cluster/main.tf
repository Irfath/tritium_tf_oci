resource "oci_containerengine_cluster" "main" {
    #Required
    compartment_id = var.compartment_id
    kubernetes_version = var.kubernetes_version
    name = var.cluster_name
    vcn_id = var.vcn_id

    #Optional
    endpoint_config {

        #Optional
        is_public_ip_enabled = var.public_endpoint_enabled
        subnet_id = var.subnet_id
    }

    //kms_key_id = var.kms_key_id
    options {
        admission_controller_options {
            is_pod_security_policy_enabled = var.pod_security_policy_enabled
        }

        service_lb_subnet_ids = var.service_lb_subnet_ids
    }
}