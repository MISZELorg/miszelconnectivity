resource "azurerm_network_security_group" "nsg" {
  name                = "${var.vnet_name}-${var.subnet_name}-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}