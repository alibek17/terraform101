#dev01-us
#qa01-us
#stg01-de
#prd01-ca
#stg02-de
#stg01-us

#environment = dev01-us
#environment_version = 01
#environment_type = dev
#market = us
#owner = devowner@example.com
#budget_owner = budget_owner@example.com

variable "env" {
}

locals {
    environment = upper(var.env)
    environment_version = regex("[0-9]+", var.env)

    env_to_owner = {
        "dev" = "devowner@example.com"
        "qa" = "qaowner@example.com"
        "stg" = "stgowner@example.com"
        "prd" = "prdowner@example.com"
    } 
    env_3 = replace(substr(var.env, 0, 3), "/[0-9]+/", "")
}

output "tags" {
    value = {
        "environment" = local.environment
        "environment_version" = local.environment_version
        "market" = element(split("-", var.env), 1) 
        "owner" = lookup(local.env_to_owner, local.env_3, "envowner@example.com")
    }
}