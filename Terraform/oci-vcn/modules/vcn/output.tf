
output "vcn_id" {
  description = "id of vcn that is created"
  value       = oci_core_vcn.test_vcn.id
}