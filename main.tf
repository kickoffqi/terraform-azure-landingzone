resource "azurerm_resource_group" "rg_network" {
  name     = var.network_resource_group_name
  location = var.location
}
resource "azurerm_resource_group" "rg_monitoring" {
  name     = var.monitoring_resource_group_name
  location = var.location
}

resource "azurerm_resource_group" "rg_aks" {
  name     = var.aks_resource_group_name
  location = var.location
}

module "network" {
  #source              = "github.com/kickoffqi/terraform-azure-landingzone//modules/vnet?ref=v0.1.1"
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg_network.name
  location            = var.location
  vnet_name           = var.network_vnet_name

  subnets = var.network_subnets

}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.rg_monitoring.name
  location            = var.location
  workspace_name      = var.monitoring_workspace_name
  retention_in_days   = var.monitoring_retention_in_days
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.aks_cluster_name
  resource_group_name = azurerm_resource_group.rg_aks.name
  location            = var.location
  dns_prefix          = var.aks_dns_prefix
  vm_size             = var.vm_size
  min_count           = var.min_count
  max_count           = var.max_count
  enable_auto_scaling = var.enable_auto_scaling

  vnet_subnet_id = module.network.subnet_ids["snet-aks"]

  log_analytics_workspace_id = module.monitoring.workspace_id

  load_balancer_sku      = var.load_balancer_sku
  service_cidr           = var.service_cidr
  dns_service_ip         = var.dns_service_ip
  network_plugin         = var.network_plugin
  local_account_disabled = var.local_account_disabled
  authorized_ip_ranges   = var.authorized_ip_ranges

  depends_on = [
    module.network,
    module.monitoring
  ]
}
