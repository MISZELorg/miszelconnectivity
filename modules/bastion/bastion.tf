resource "azurerm_public_ip" "bastionhost" {
  name                = "${var.virtual_network_name}-bastion-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_bastion_host" "bastionhost" {
  name                = "${var.virtual_network_name}-bastion"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  depends_on = [
    azurerm_public_ip.bastionhost
  ]

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.bastionhost.id
  }

  timeouts {
    create = "60m"
    update = "60m"
    delete = "60m"
  }
}