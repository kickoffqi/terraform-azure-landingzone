module "network" {
  #source              = "github.com/kickoffqi/terraform-azure-landingzone//modules/vnet?ref=v0.1.1"
  source              = "./modules/vnet"
  resource_group_name = "rg-terraform-mgmt"
  location            = "australiaeast"
  vnet_name           = "vnet-lz-prod-ae"

  subnets = {
    "snet-aks"    = "10.0.1.0/24"
    "snet-shared" = "10.0.2.0/24"
  }

}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = "rg-terraform-mgmt"
  location            = "australiaeast"
  workspace_name      = "law-lz-prod-ae"
  retention_in_days   = 30
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = "aks-lz-prod-ae"
  resource_group_name = "rg-terraform-mgmt"
  location            = "australiaeast"
  dns_prefix          = "aks-lz-prodae"

  vnet_subnet_id = module.network.subnet_ids["snet-aks"]

  log_analytics_workspace_id = module.monitoring.workspace_id

  depends_on = [
    module.network,
    module.monitoring
  ]
}
