
data "oci_apigateway_gateways" "api_gateways" {
    #Required
    compartment_id = var.compartment_ocid

    #Optional
    #certificate_id = var.oci_apigateway_certificate.test_certificate.id
    display_name = "fndemo-apigwt"
    state = "Active"
}