resource "azurerm_resource_group" "netwatch_rg" {
  name     = "NetworkWatcherRG"
  location = var.location
}

resource "azurerm_network_watcher" "NetworkWatcher_northeurope" {
  name                = "NetworkWatcher_${var.location}"
  location            = var.location
  resource_group_name = azurerm_resource_group.netwatch_rg.name
}

# resource "azurerm_network_watcher_flow_log" "flow_log" {
#   count                       = length(data.azurerm_virtual_network.vnets) > 0 ? length(data.azurerm_virtual_network.vnets) : 0
#   network_watcher_name = azurerm_network_watcher.NetworkWatcher_northeurope.name
#   resource_group_name  = azurerm_resource_group.netwatch_rg.name
#   name                 = "example-log"

#   network_security_group_id = azurerm_network_security_group.test.id
#   storage_account_id        = azurerm_storage_account.test.id
#   enabled                   = true

#   retention_policy {
#     enabled = true
#     days    = 7
#   }

#   traffic_analytics {
#     enabled               = true
#     workspace_id          = azurerm_log_analytics_workspace.test.workspace_id
#     workspace_region      = azurerm_log_analytics_workspace.test.location
#     workspace_resource_id = azurerm_log_analytics_workspace.test.id
#     interval_in_minutes   = 10
#   }
# }