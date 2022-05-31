#OCI resources
#Latest comments on oci vcn resources tf script


resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_id
  display_name   = var.label_prefix == "none" ? var.internet_gateway_display_name : "${var.label_prefix}-${var.internet_gateway_display_name}"

  #freeform_tags = var.freeform_tags
  #defined_tags = var.defined_tags

  vcn_id = oci_core_vcn.test_vcn.id

  count = var.create_internet_gateway == true ? 1 : 0
}


