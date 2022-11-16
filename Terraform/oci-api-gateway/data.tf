
data "oci_apigateway_gateways" "api_gateways" {
    #Required
    compartment_id = var.compartment_ocid

    #Optional
    #certificate_id = var.oci_apigateway_certificate.test_certificate.id
    display_name = "fndemo-apigwt"
    state = "Active"
}

data "oci_apigateway_gateway" "apigw" {
    gateway_id = oci_apigateway_gateway.test-apigwt.id
}

data "oci_apigateway_deployments" "apigw_deployments" {
    #Required
    compartment_id = var.compartment_ocid
    #Optional
    display_name = "v1"
    gateway_id = data.oci_apigateway_gateway.apigw.id
    state = "Active"
}


data "oci_apigateway_usage_plans" "test_usage_plans" {
    #Required
    compartment_id = var.compartment_ocid

    #Optional
    display_name = var.usage_plan_display_name
    state = "Active"
}


output "subscribers_usgplns_out"{
    value = {
        for_each = {
            for idx, pln in data.oci_apigateway_usage_plans.test_usage_plans.usage_plan_collection: 
                idx => pln.items[0].id
        }
    }
}
