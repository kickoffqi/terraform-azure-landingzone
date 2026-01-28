module "network" {
  source              = "./modules/vnet"
  resource_group_name = "rg-terraform-mgmt"
  location            = "australiaeast"
  vnet_name           = "vnet-lz-prod-ae"

  subnets = {
    "snet-aks"    = "10.0.1.0/24"
    "snet-shared" = "10.0.2.0/24"
  }

}
