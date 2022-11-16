
resource "oci_apigateway_subscriber" "test_subscriber" {
    #Required
    clients {
        #Required
        name = var.clients.name
        token = var.clients.token
    }
    compartment_id = var.compartment_ocid
    usage_plans = local.subscriber_usgpln_ids

    #Optional
    #defined_tags = {"Operations.CostCenter"= "42"}
    display_name = var.subscriber_display_name
    #freeform_tags = {"Department"= "Finance"}
}