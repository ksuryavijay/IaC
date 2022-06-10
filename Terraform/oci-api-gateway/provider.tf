provider oci {
	region = var.region
	alias  = "home"
}

terraform {
  required_providers {
    oci = {
      source                = "oracle/oci"
      version               = ">= 4.67.3"
      configuration_aliases = [oci.home]
    }
  }
  required_version = ">= 1.0.0"
}