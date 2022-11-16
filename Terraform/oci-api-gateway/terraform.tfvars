
region = "eu-marseille-1"
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaawrvaz3qenxkroaq6zxnqfndsqvm4nylcxlnhpyp7mrbbo2pzhboa" 

label_prefix = "none"

//Network details
vcn_name = "prac-vcn"
vcn_dns_label = "pracvcn"
vcn_cidr_block = "10.12.0.0/16"

subnet_cidr_block = "10.12.0.0/24"
subnet_name = "prac-sn"

create_internet_gateway = "true"
internet_gateway_display_name = "intgt"

apigtw_name = "demo-apigtw"
endpoint_type = "PUBLIC"   #"PUBLIC" or "PRIVATE"

connect_timeout_in_seconds = "60"
is_ssl_enabled          = "true"
is_ssl_verify_disabled  = "false"
read_timeout_in_seconds = "10"
send_timeout_in_seconds = "10"

#Usage plan resources
usage_plan_deployments = ["v1"]
usage_plan_entitlements_name = "apigwusageplnentlmnt"
usage_plan_entitlements_description = "apigw_usagepln_entlmnt_description"
usage_plan_display_name = "apigw_usagepln"


#  Supported API backend type
#  - ORACLE_FUNCTIONS_BACKEND
#  - HTTP_BACKEND
#  - STOCK_RESPONSE_BACKEND

#  Valid Usage Plan token_location
#    "request.headers[token]"
#    "request.query[token]"
#    "request.auth[Token]"
#    "request.path[TOKEN]"

deployments = [
  {
    name = "v1"
    path_prefix = "v1"
    token_location =  ["request.headers[Authorization]"]
    routes = [
      {      
        path = "/exmpl"
        backend = {
          type = "HTTP_BACKEND"
          url  = "https://example.com/"
        }
        methods = ["GET","POST"]
      },
      {      
        path = "/orcl"
        backend = {
          type = "HTTP_BACKEND"
          url  = "https://www.oracle.com/"
        }
        methods = ["POST"]
      },
      {      
        path = "/stock"
        backend = {
          type = "STOCK_RESPONSE_BACKEND"
        }
        methods = ["GET"]
      }
    ]
  },
  {
    name = "v2"
    path_prefix = "v2"
    token_location =  [] # keep emtpy if no usage plan for the deployment
    routes = [
      {      
        path = "/exmpl"
        backend = {
          type = "HTTP_BACKEND"
          url  = "https://example.com/"
        }
        methods = ["GET","POST"]
      },
      {      
        path = "/orcl"
        backend = {
          type = "HTTP_BACKEND"
          url  = "https://www.oracle.com/"
        }
        methods = ["POST"]
      },
      {      
        path = "/user"
        backend = {
          type = "HTTP_BACKEND"
          url  = "https://gorest.co.in/public/v2/users/9"
        }
        methods = ["GET"]
      }
    ]
  }
]

