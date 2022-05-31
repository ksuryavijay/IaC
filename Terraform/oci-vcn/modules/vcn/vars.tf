
variable compartment_id { 
  default = "ocid1.compartment.oc1..aaaaaaaawrvaz3qenxkroaq6zxnqfndsqvm4nylcxlnhpyp7mrbbo2pzhboa" 
}

variable "vcn_name" {
  type = string
  default = "test_vcn"
}

variable "vcn_dns_label" {
  type = string
  default = "test_vcn"
}

variable "vcn_cidr_block" {
  type = string
  default = "10.10.0.0/16"
}

variable internet_gateway_display_name {
  type = string
  default = "ig"
}

variable label_prefix {
  type = string
  default = "none"
}

variable subnet_cidr_block {
  type = string
  default = "10.10.0.0/24"
}

variable subnet_name {
  type = string
  default = "test_sn"
}

variable create_internet_gateway {
  type = bool
  default = false
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The oci region where resources will be created."
  type        = string
}