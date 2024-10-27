output "network_watcher_id" {
  value = azurerm_network_watcher.NetworkWatcher_northeurope.id
}

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.netwatch_rg.id
}