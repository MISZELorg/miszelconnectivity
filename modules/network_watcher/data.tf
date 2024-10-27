data "azurerm_virtual_network" "vnets" {
  count               = length(data.azurerm_resource_group.netwatch_rg) > 0 ? 1 : 0
  name                = "*-vnet"
  resource_group_name = azurerm_resource_group.netwatch_rg.name
}