terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-mgmt"
    storage_account_name = "tfstate1769560449"
    container_name       = "tfstate"
    key                  = "landingzone.terraform.tfstate"
  }
}
