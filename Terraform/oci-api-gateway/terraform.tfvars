

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

deployments = [
  {
    name = "messages-v1"
    path_prefix = "v1"
    routes = [
      {      
        path = "/message01"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://hostname:port/message01"
        }
        methods = ["GET","POST"]
      },
      {      
        path = "/message02"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://hostname:port/message02"
        }
        methods = ["POST"]
      }
    ]
  },
  {
    name = "messages-v2"
    path_prefix = "v2"
    routes = [
      {      
        path = "/message01"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://hostname:port/message01"
        }
        methods = ["GET"]
      },
      {      
        path = "/message02"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://hostname:port/message02"
        }
        methods = ["POST"]
      },
      {      
        path = "/message03"
        backend = {
          type = "HTTP_BACKEND"
          url  = "http://hostname:port/message03"
        }
        methods = ["GET","POST"]
      }
    ]
  }
]

