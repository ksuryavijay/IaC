
# Identity and access parameters
variable "api_fingerprint" {
  description = "Fingerprint of oci api private key."
  type        = string
}

variable "api_private_key_path" {
  description = "The path to oci api private key."
  type        = string
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The oci region where resources will be created."
  type        = string
}

variable "tenancy_id" {
  description = "The tenancy id in which to create the resources."
  type        = string
}

variable "user_id" {
  description = "The id of the user that terraform will use to create the resources."
  type        = string
}

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