#OCI resources
#Latest comments on oci vcn resources tf script

resource "oci_core_vcn" "test_vcn" {
    #Required
    compartment_id = var.compartment_id

    cidr_block = var.vcn_cidr_block
    #cidr_blocks = var.vcn_cidr_blocks
    
    display_name = var.vcn_name
    dns_label = var.vcn_dns_label
    
    freeform_tags = {"Department"= "Finance"}
    defined_tags = {"Operations.CostCenter"= "42"}
}