locals {
    environment = "dev"
}

module "infra" {
    source = "../infra"
    environment_name = local.environment
    
}