#OCI resources
#Latest comments on oci vcn resources tf script


resource "vcn"{
    source = "./modules/vcn" 

    vcn_name = var.vcn_name
    vcn_dns_label = var.vcn_dns_label
    vcn_cidr_block = var.vcn_cidr_block

    subnet_cidr_block = var.subnet_cidr_block
    subnet_name = var.subnet_name
}

resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_id
  display_name   = var.label_prefix == "none" ? var.internet_gateway_display_name : "${var.label_prefix}-${var.internet_gateway_display_name}"

  #freeform_tags = var.freeform_tags
  #defined_tags = var.defined_tags

  vcn_id = data.oci_core_vcn.test_vcn.vcn_id

  count = var.create_internet_gateway == true ? 1 : 0
}


