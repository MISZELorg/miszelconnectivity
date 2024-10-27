output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, v in azurerm_subnet.hub_subnets : k => v.id }
}

output "nsg_ids" {
  description = "Map of NSG IDs"
  value       = { for k, v in azurerm_network_security_group.nsgs : k => v.id }
}

# output "subnet_ids" {
#   description = "Map of subnet IDs by subnet name."
#   value       = { for name, subnet in azurerm_subnet.hub_subnets : name => subnet.id }
# }
