## This configuration was generated by terraform-provider-oci

# API Gateway resource
resource oci_apigateway_gateway "test-apigwt" {
  #certificate_id = <<Optional value not found in discovery>>
  compartment_id = var.compartment_ocid
  
  display_name = var.apigtw_name
  endpoint_type = var.endpoint_type
  network_security_group_ids = [ ]

  response_cache_details {
    #authentication_secret_id = <<Optional value not found in discovery>>
    #authentication_secret_version_number = <<Optional value not found in discovery>>
    connect_timeout_in_ms = var.connect_timeout_in_seconds
    is_ssl_enabled = var.is_ssl_enabled
    is_ssl_verify_disabled = var.is_ssl_verify_disabled
    read_timeout_in_ms = var.read_timeout_in_ms
    send_timeout_in_ms = var.send_timeout_in_ms
    #servers = <<Optional value not found in discovery>>
    type = "NONE"
  }
  #Network subnet
  subnet_id = module.vcn.subnet_id
  
  depends_on = [
    module.vcn
  ]
}

# Create api deployment resources
resource oci_apigateway_deployment demo-apigwt-dply {
  compartment_id = var.compartment_ocid
  #gateway_id  = oci_apigateway_gateway.test-apigwt.id
  gateway_id  = data.oci_apigateway_gateway.test_api.id
  
  #iterate over list of deployments
  for_each = {
    for deployment_v in var.deployments: deployment_v.name => deployment_v
  }
  path_prefix = "/${each.value.path_prefix}"
  display_name = each.value.name  

  specification {
    logging_policies {
      execution_log {
        is_enabled = "true"
        log_level  = "INFO"
      }
    }
    request_policies {      
      dynamic "usage_plans"{
        for_each = length(each.value.token_location) > 0 ? [1]: []      

        content {
          token_locations = each.value.token_location
        }
      }       
    }

    //iterate over routes for each deployment
    dynamic "routes" {
      for_each = each.value.routes

      content{        
        methods = routes.value.methods
        path = routes.value.path     
        
        backend{   
            type = routes.value.backend.type
            
            #properties for HTTP_BACKEND
            url  = routes.value.backend.type == "HTTP_BACKEND" ? routes.value.backend.url : null
            connect_timeout_in_seconds 	= routes.value.backend.type == "HTTP_BACKEND" ? var.connect_timeout_in_seconds : null
            is_ssl_verify_disabled  	= routes.value.backend.type == "HTTP_BACKEND" ? var.is_ssl_verify_disabled : null
            read_timeout_in_seconds 	= routes.value.backend.type == "HTTP_BACKEND" ? var.read_timeout_in_seconds : null
            send_timeout_in_seconds 	= routes.value.backend.type == "HTTP_BACKEND" ? var.send_timeout_in_seconds : null      

            #properties for ORACLE_FUNCTIONS_BACKEND
            function_id  = routes.value.backend.type == "ORACLE_FUNCTIONS_BACKEND" ? routes.value.backend.function_id : null

            # properties for STOCK_RESPONSE_BACKEND
            status = routes.value.backend.type == "STOCK_RESPONSE_BACKEND" ? "200" : null
            headers {
                    name = "Content-Type"
                    value = "application/json"
                    }
            body = routes.value.backend.type == "STOCK_RESPONSE_BACKEND" ? "{\"username\": \"john.doe\"}" : null
        }

        /*
        backend {  
            
            connect_timeout_in_seconds 	= var.connect_timeout_in_seconds
            is_ssl_verify_disabled  	= var.is_ssl_verify_disabled
            read_timeout_in_seconds 	= var.read_timeout_in_seconds
            send_timeout_in_seconds 	= var.send_timeout_in_seconds

            type = routes.value.backend.type
            url  = routes.value.backend.url          
          */
          /*
          # check for backend type
          for_each = routes.value.backend.type == "HTTP_BACKEND" ? {
            connect_timeout_in_seconds 	= var.connect_timeout_in_seconds
            is_ssl_verify_disabled  	= var.is_ssl_verify_disabled
            read_timeout_in_seconds 	= var.read_timeout_in_seconds
            send_timeout_in_seconds 	= var.send_timeout_in_seconds

            type = routes.value.backend.type
            url  = routes.value.backend.url
          } : { routes.value.backend.type == "ORACLE_FUNCTIONS_BACKEND" ? {
                  type = routes.value.backend.type
                  "functionId": routes.value.backend.function_id
                }: {}
              }
          
          } : routes.value.backend.type == "STOCK_RESPONSE_BACKEND" ?
            type = routes.value.backend.type
            "status": 200,
            "headers": [{
              "name": "Content-Type",
              "value": "application/json"
            }],
            "body" : "{\"username\": \"john.doe\"}"
          } : {}         
          
          
          for_each = routes.value.backend.type == "HTTP_BACKEND" ? {
            connect_timeout_in_seconds 	= var.connect_timeout_in_seconds
            is_ssl_verify_disabled  	= var.is_ssl_verify_disabled
            read_timeout_in_seconds 	= var.read_timeout_in_seconds
            send_timeout_in_seconds 	= var.send_timeout_in_seconds

            type = routes.value.backend.type
            url  = routes.value.backend.url
          }: ""
          for_each = routes.value.backend.type == "ORACLE_FUNCTIONS_BACKEND" ? {            
            type = routes.value.backend.type
            "functionId": routes.value.backend.function_id
          } : ""

          for_each = routes.value.backend.type == "STOCK_RESPONSE_BACKEND" ? {            
            type = routes.value.backend.type
            "status": 200,
            "headers": [{
              "name": "Content-Type",
              "value": "application/json"
            }],
            "body" : "{\"username\": \"john.doe\"}"
          } : "" 
          */
        //}
      }    
    }

  /*
    routes {
      backend {
        #body = <<Optional value not found in discovery>>
        connect_timeout_in_seconds = "60"
        #function_id = <<Optional value not found in discovery>>
        #headers = <<Optional value not found in discovery>>
        is_ssl_verify_disabled  = "false"
        read_timeout_in_seconds = "10"
        send_timeout_in_seconds = "10"
        #status = <<Optional value not found in discovery>>
        type = "HTTP_BACKEND"
        url  = "http://139.185.38.133:3000/bot/agent"
      }
      logging_policies {
        #access_log = <<Optional value not found in discovery>>
        execution_log {
          #is_enabled = <<Optional value not found in discovery>>
          log_level = ""
        }
      }
      methods = [
        "GET",
        "POST",
      ]
      path = "/route/path"
      request_policies {
        authorization {
          #allowed_scope = <<Optional value not found in discovery>>
          type = "AUTHENTICATION_ONLY"
        }
        #body_validation = <<Optional value not found in discovery>>
        #cors = <<Optional value not found in discovery>>
        header_transformations {
          #filter_headers = <<Optional value not found in discovery>>
          #rename_headers = <<Optional value not found in discovery>>
          set_headers {
            items {
              if_exists = "OVERWRITE"
              name      = "username"
              values = [
                
              ]
            }
          }
        }
        #header_validations = <<Optional value not found in discovery>>
        #query_parameter_transformations = <<Optional value not found in discovery>>
        #query_parameter_validations = <<Optional value not found in discovery>>
        #response_cache_lookup = <<Optional value not found in discovery>>
      }
      response_policies {
        #header_transformations = <<Optional value not found in discovery>>
        #response_cache_store = <<Optional value not found in discovery>>
      }
    }
    */
  }

  depends_on = [ ]
}

