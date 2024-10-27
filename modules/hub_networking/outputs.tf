output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, v in azurerm_subnet.hub_subnets : k => v.id }
}

output "nsg_ids" {
  description = "Map of NSG IDs"
  value       = { for k, v in azurerm_network_security_group.nsgs : k => v.id }
}

output "hub_vnet_name" {
  description = "xxx"
  value       = azurerm_virtual_network.hub_vnet.name
}

output "hub_rg_name" {
  description = "xxx"
  value       = azurerm_resource_group.hub_rg.name
}

# output "subnet_ids" {
#   description = "Map of subnet IDs by subnet name."
#   value       = { for name, subnet in azurerm_subnet.hub_subnets : name => subnet.id }
# }
