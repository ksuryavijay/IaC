# Identity and access parameters
variable "api_fingerprint" {
  description = "Fingerprint of oci api private key."
  type        = string
  default     = "aa.bb.cc.dd"
}

variable "api_private_key_path" {
  description = "The path to oci api private key."
  type        = string
  default     = "~/.oci/userprivate.key"
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The oci region where resources will be created."
  type        = string
  default = "eu-frankfurt-1"
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

variable compartment_ocid { 
  type = string
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

variable apigtw_name{
  type = string
  default = "test-apigtw"
}

variable endpoint_type{
  type = string
  default = "PUBLIC"
}

variable connect_timeout_in_seconds {
    type = string
  default = "60"
}

variable is_ssl_verify_disabled {
  type = string 
  default = "false"
}

variable read_timeout_in_seconds {
  type = string
  default = "10"
}

variable send_timeout_in_seconds {
  type = string 
  default = "10"
}

variable "deployments" {
  #type = map
  default = {
    deploy1 = {
      name = "demo-delpoy"
      path_prefix = "/v1"
      route = [
        {      
          path = "/message01"
          backend = {
            type = "HTTP_BACKEND"
            url  = "http://hostname:port/message01"
          }
          methods = ["GET","POST"]
        },
        {      
          path = "/message02"
          backend = {
            type = "HTTP_BACKEND"
            url  = "http://hostname:port/message02"
          }
          methods = ["GET","POST"]
        }
      ]
    }
  }
}

variable "api_routes" {
  type = map
  default = {
    v1 = [
      {
        path = "/bot/message"
        backend = {
          connect_timeout_in_seconds = "60"
          is_ssl_verify_disabled  = "false"
          read_timeout_in_seconds = "10"
          send_timeout_in_seconds = "10"
          type = "HTTP_BACKEND"
          url  = "http://139.185.38.133:3000/bot/message"
          }
        methods = ["GET","POST"]
      }
    ]
  }
}

/*
variable "deployments" {
  type = list(object({
    name = string
    path_prefix = string

  }))
  default = [
    {
      name = "demo-delpoy"
      path_prefix = "/v1"
    }
  ]
}

*/