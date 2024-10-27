# # Resource Group and Virtual Network

# resource "azurerm_resource_group" "hub_rg" {
#   name     = "${var.hub_prefix}-rg"
#   location = var.location
#   tags     = var.hub_tags
# }

# resource "azurerm_virtual_network" "hub_vnet" {
#   name                = "${var.hub_prefix}-vnet"
#   resource_group_name = azurerm_resource_group.hub_rg.name
#   location            = var.location
#   address_space       = var.hub_vnet_cidr
#   tags                = var.hub_tags
# }

# # Define Subnets
# resource "azurerm_subnet" "hub_subnets" {
#   for_each                          = var.subnets
#   name                              = each.key
#   resource_group_name               = azurerm_resource_group.hub_rg.name
#   virtual_network_name              = azurerm_virtual_network.hub_vnet.name
#   address_prefixes                  = [each.value.address_prefix]
#   private_endpoint_network_policies = "Disabled"
# }

# # Define NSGs
# resource "azurerm_network_security_group" "nsgs" {
#   for_each            = var.subnets
#   name                = "${each.key}-nsg"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.hub_rg.name
#   tags                = var.hub_tags
# }

# # Associate NSGs with Subnets
# resource "azurerm_subnet_network_security_group_association" "nsg_associations" {
#   for_each                  = azurerm_subnet.hub_subnets
#   subnet_id                 = azurerm_subnet.hub_subnets[each.key].id
#   network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
# }
