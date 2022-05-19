#OCI resources
#Latest comments on oci vcn resources tf script

resource "oci_core_vcn" "test_vcn" {
    #Required
    compartment_id = var.compartment_id

    cidr_block = var.vcn_cidr_block
    #cidr_blocks = var.vcn_cidr_blocks
    
    display_name   = var.label_prefix == "none" ? var.vcn_name : "${var.label_prefix}-${var.vcn_name}"
    dns_label = var.vcn_dns_label
    
    #freeform_tags = {"Department"= "Finance"}
    #defined_tags = {"Operations.CostCenter"= "42"}
}


resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_id
  display_name   = var.label_prefix == "none" ? var.internet_gateway_display_name : "${var.label_prefix}-${var.internet_gateway_display_name}"

  #freeform_tags = var.freeform_tags
  #defined_tags = var.defined_tags

  vcn_id = oci_core_vcn.test_vcn.id

  count = var.create_internet_gateway == true ? 1 : 0
}


resource "oci_core_subnet" "test_subnet" {
    #Required
    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.test_vcn.id

}