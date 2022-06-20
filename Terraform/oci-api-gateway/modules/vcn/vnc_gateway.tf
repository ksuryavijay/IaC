
resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_id
  display_name   = "ig"

  vcn_id = oci_core_vcn.test_vcn.id
}

resource "oci_core_route_table" "publicrt" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.test_vcn.id
  display_name   = "pubrt"

  route_rules {
    # * With this route table, Internet Gateway is always declared as the default gateway
    destination       = local.anywhere
    network_entity_id = oci_core_internet_gateway.ig.id
    description       = "Terraformed - Auto-generated at Internet Gateway creation: Internet Gateway as default gateway"
  }

}