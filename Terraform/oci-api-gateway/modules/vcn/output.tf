
output "vcn_id" {
  description = "id of vcn that is created"
  value       = oci_core_vcn.test_vcn.id
}

output "subnet_id" {
    value = oci_core_subnet.test_subnet.id
}