
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

locals {
    subscriber_usgpln_ids = flatten(data.oci_apigateway_usage_plans.test_usage_plans.usage_plan_collection[*].items[*].id)
}

output "all_usgplns_out"{
    value = local.subscriber_usgpln_ids
}