/*output "okecluster" {
  value = oci_containerengine_cluster.main
} */

output "cluster_id" {
  value = oci_containerengine_cluster.main.id
}