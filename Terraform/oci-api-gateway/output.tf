
output "deployments"{  
    value = {for k, v in var.deployments: k => v.path_prefix}
}

/*
output "deployments00"{  
    value = {for deployment_key, deployment_value in var.deployments: deployment_value.name => 
                { for rt_key, rt_value in deployment_value.routes: rt_key =>
                    rt_value.methods 
                }
            }
}

output "deployments01"{  
    value = {
        for_each = { 
            for value in var.deployments: value.name => {
                for rt in value.routes: rt.path => rt
            }
        }
    }
}

output "_00"{
    value = {
        for_each = {
            for deployment_k, deployment_v in var.deployments: deployment_k => deployment_v
        }
    }
}

output "route_00"{
    value = {for k, rt in var.routes["v2"]: k => rt.methods}
} 

output "methods"{  
    value = {for k, v in var.deployments: v.name => [for m in var.routes[v.path_prefix]: m.methods]}
}


output "route"{
    value = {for k, v in var.routes: k => [for rt in v: rt.methods] }
}

output "rt"{
    value = {for k, v in var.routes: k => v}
}

resource "null_resource" "routes" {
  for_each = var.routes  
  dynamic "rt"{
    for_each = [for s in each.value: {
      methods   = s.methods
    }]
  }
  content{
      allowed_mtd = rt.value.methods
  }  
}
output "routes" {
  value = null_resource.routes
}
*/

output "dep_usg_pln"{
    value = { 
        for_each = {
            for dep in data.oci_apigateway_deployments.apigw_deployments.deployment_collection: 
                #dep.id => dep.specification.logging_policies
                dep.id => dep.specification
        }            
    }
}