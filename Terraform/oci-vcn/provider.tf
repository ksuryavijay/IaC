provider oci {
	auth = "InstancePrincipal"
	region = var.region
}

terraform {
  required_providers {
    mycloud = {
      source  = "oracle/oci"
      version = "~> 1.0"
    }
  }
}

