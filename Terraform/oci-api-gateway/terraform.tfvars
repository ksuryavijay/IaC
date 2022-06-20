

region = "eu-marseille-1"

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
is_ssl_verify_disabled  = "false"
read_timeout_in_seconds = "10"
send_timeout_in_seconds = "10"


#  Supported API backend type
#  - ORACLE_FUNCTIONS_BACKEND
#  - HTTP_BACKEND
#  - STOCK_RESPONSE_BACKEND

deployments = [
  {
    name = "v1"
    path_prefix = "v1"
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
        path = "/message02"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://10.10.10.10:3000/bot/message"
        }
        methods = ["POST"]
      },
      {      
        path = "/message02"
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
    routes = [
      {      
        path = "/message01"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://10.10.10.10:3000/bot/message"
        }
        methods = ["GET"]
      },
      {      
        path = "/message02"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://10.10.10.10:3000/bot/message"
        }
        methods = ["POST"]
      },
      {      
        path = "/message03"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://10.10.10.10:3000/bot/message"
        }
        methods = ["POST"]
      }
    ]
  }
]

