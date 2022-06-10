
# Module to create network components.
module "vcn" {
    source = "./modules/vcn" 

    vcn_name = var.vcn_name
    vcn_dns_label = var.vcn_dns_label
    vcn_cidr_block = var.vcn_cidr_block

    subnet_cidr_block = var.subnet_cidr_block
    subnet_name = var.subnet_name

    region = var.region
}