
# Identity and access parameters
variable "api_fingerprint" {
  description = "Fingerprint of oci api private key."
  type        = string
  default     = ""
}

variable "api_private_key_path" {
  description = "The path to oci api private key."
  type        = string
  default     = ""
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The oci region where resources will be created."
  type        = string
  default     = ""
}

variable "tenancy_id" {
  description = "The tenancy id in which to create the resources."
  type        = string
  default = ""
}

variable "user_id" {
  description = "The id of the user that terraform will use to create the resources."
  type        = string
  default = ""
}

variable compartment_id { 
  description = "The OCI compartment id to create resources"
  type        = string
  default = "ocid1.compartment.oc1" 
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