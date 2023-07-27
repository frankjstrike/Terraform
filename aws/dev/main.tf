locals {
    environment = "dev"
}

module "infra" {
    source = "../../modules/infra"
    environment = local.environment
    
}