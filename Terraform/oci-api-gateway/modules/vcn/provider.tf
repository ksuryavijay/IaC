terraform {
  #required_version = ">= 0.12.6"
  required_version = ">= 1.0.0"
  required_providers {
    oci = {
      source                = "oracle/oci"
      version               = ">= 4.67.3"
      #configuration_aliases = [oci.home]
    }
  }
}

provider oci {
	#auth = "InstancePrincipal"
	region = var.region
	#alias  = "home"
}


