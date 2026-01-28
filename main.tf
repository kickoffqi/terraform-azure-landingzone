module "network" {
  source              = "https://github.com/kickoffqi/terraform-azure-landingzone/tree/main/modules/vnet?ref=v0.1.0"
  resource_group_name = "rg-terraform-mgmt"
  location            = "australiaeast"
  vnet_name           = "vnet-lz-prod-ae"

  subnets = {
    "snet-aks"    = "10.0.1.0/24"
    "snet-shared" = "10.0.2.0/24"
  }

}
