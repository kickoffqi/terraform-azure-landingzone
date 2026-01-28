output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "The IDs of the Subnets"
  value       = { for k, v in azurerm_subnet.this : k => v.id }
}
