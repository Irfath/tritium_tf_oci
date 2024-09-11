output "address_lists" {
  value = {
    for i in oci_waas_address_list.main:
      i.display_name => i
  }
}

output "id" {
  value = oci_waas_address_list.main[0].id

}