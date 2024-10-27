output "hub_vnet_id" {
  description = "ID of the hub virtual network."
  value       = azurerm_virtual_network.hub_vnet.id
}

output "hub_vnet_name" {
  description = "ID of the hub virtual network."
  value       = azurerm_virtual_network.hub_vnet.name
}

output "hub_rg_name" {
  description = "Name of the hub resource group."
  value       = azurerm_resource_group.hub_rg.name
}

output "hub_bastion_subnet_id" {
  description = "ID of the bastion subnet."
  value       = azurerm_subnet.hub_bastion.id
}

output "hub_gateway_subnet_id" {
  description = "ID of the gateway subnet."
  value       = azurerm_subnet.hub_gateway.id
}

output "hub_firewall_subnet_id" {
  description = "ID of the firewall subnet."
  value       = azurerm_subnet.hub_firewall.id
}

output "hub_infra_subnet_id" {
  description = "ID of the infra subnet."
  value       = azurerm_subnet.hub_infra.id
}

output "hub_dev_subnet_id" {
  description = "ID of the dev subnet."
  value       = azurerm_subnet.hub_dev.id
}

output "hub_infra_subnet_name" {
  description = "Name of the infra subnet."
  value       = azurerm_subnet.hub_infra.name
}

output "hub_dev_subnet_name" {
  description = "Name of the dev subnet."
  value       = azurerm_subnet.hub_dev.name
}

output "hub_firewall_subnet_name" {
  description = "Name of the firewall subnet."
  value       = azurerm_subnet.hub_firewall.name
}

output "hub_gateway_subnet_name" {
  description = "Name of the gateway subnet."
  value       = azurerm_subnet.hub_gateway.name
}

output "hub_bastion_subnet_name" {
  description = "Name of the bastion subnet."
  value       = azurerm_subnet.hub_bastion.name
}