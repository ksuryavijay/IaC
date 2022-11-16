#
# request.headers[Authorization]

resource "oci_apigateway_usage_plan" "test_usage_plan" {
    #Required
    compartment_id = var.compartment_ocid
    entitlements {
        #Required
        name = var.usage_plan_entitlements_name

        #Optional
        description = var.usage_plan_entitlements_description
        
        dynamic "targets" {
            for_each = data.oci_apigateway_deployments.apigw_deployments.deployment_collection

            content{
                deployment_id = contains(var.usage_plan_deployments, targets.value.display_name) == true ? targets.value.id : ""
            }
        }
    }

    #Optional
    #defined_tags = {"Operations.CostCenter"= "42"}
    display_name = var.usage_plan_display_name
    #freeform_tags = {"Department"= "Finance"}
}