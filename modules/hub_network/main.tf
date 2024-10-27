resource "azurerm_resource_group" "hub_rg" {
  name     = "${var.hub_prefix}-rg"
  location = var.location
  tags     = var.hub_tags
}

# Hub VNET

resource "azurerm_virtual_network" "hub_vnet" {
  name                = "${var.hub_prefix}-vnet"
  resource_group_name = azurerm_resource_group.hub_rg.name
  location            = var.location
  address_space       = var.hub_vnet_cidr
  dns_servers         = null
  tags                = var.hub_tags
  depends_on = [
    azurerm_resource_group.hub_rg
  ]

}

# Hub SUBNETS 

# Firewall Subnet

resource "azurerm_subnet" "hub_firewall" {
  name                              = "AzureFirewallSubnet"
  resource_group_name               = azurerm_resource_group.hub_rg.name
  virtual_network_name              = azurerm_virtual_network.hub_vnet.name
  address_prefixes                  = var.firewall_subnet_cidr
  private_endpoint_network_policies = "Disabled"
  depends_on = [
    azurerm_virtual_network.hub_vnet
  ]

}

# Gateway Subnet 

resource "azurerm_subnet" "hub_gateway" {
  name                              = "GatewaySubnet"
  resource_group_name               = azurerm_resource_group.hub_rg.name
  virtual_network_name              = azurerm_virtual_network.hub_vnet.name
  address_prefixes                  = var.gateway_subnet_cidr
  private_endpoint_network_policies = "Disabled"
  depends_on = [
    azurerm_virtual_network.hub_vnet
  ]

}

# Bastion Subnet 

resource "azurerm_subnet" "hub_bastion" {
  name                              = "AzureBastionSubnet"
  resource_group_name               = azurerm_resource_group.hub_rg.name
  virtual_network_name              = azurerm_virtual_network.hub_vnet.name
  address_prefixes                  = var.bastion_subnet_cidr
  private_endpoint_network_policies = "Disabled"
  depends_on = [
    azurerm_virtual_network.hub_vnet
  ]
}

# Infra Subnet

resource "azurerm_subnet" "hub_infra" {
  name                              = "infrasubnet"
  resource_group_name               = azurerm_resource_group.hub_rg.name
  virtual_network_name              = azurerm_virtual_network.hub_vnet.name
  address_prefixes                  = var.infra_subnet_cidr
  private_endpoint_network_policies = "Disabled"
  depends_on = [
    azurerm_virtual_network.hub_vnet
  ]
}

# Dev Subnet

resource "azurerm_subnet" "hub_dev" {
  name                              = "devsubnet"
  resource_group_name               = azurerm_resource_group.hub_rg.name
  virtual_network_name              = azurerm_virtual_network.hub_vnet.name
  address_prefixes                  = var.dev_subnet_cidr
  private_endpoint_network_policies = "Disabled"
  depends_on = [
    azurerm_virtual_network.hub_vnet
  ]
}
