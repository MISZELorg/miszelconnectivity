output "location" {
  description = "Hub RG location"
  value       = azurerm_resource_group.hub_rg.location
}

output "hub_rg_name" {
  description = "Hub RG name"
  value       = azurerm_resource_group.hub_rg.name
}

output "hub_vnet_name" {
  description = "Hub Vnet name"
  value       = azurerm_virtual_network.hub_vnet.name
}

output "hub_vnet_id" {
  description = "Hub Vnet name"
  value       = azurerm_virtual_network.hub_vnet.id
}

output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, v in azurerm_subnet.hub_subnets : k => v.id }
}

output "nsg_ids" {
  description = "Map of NSG IDs"
  value       = { for k, v in azurerm_network_security_group.nsgs : k => v.id }
}