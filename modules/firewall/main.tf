resource "azurerm_public_ip" "firewall" {
  name                = "${var.virtual_network_name}-firewall-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_firewall" "firewall" {
  name                = "${var.virtual_network_name}-firewall"
  resource_group_name = var.resource_group_name
  location            = var.location
  firewall_policy_id  = var.firewall_policy_id
  threat_intel_mode   = "Deny"
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  tags                = var.tags
  depends_on = [
    azurerm_public_ip.firewall
  ]

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }

  timeouts {
    create = "60m"
    update = "60m"
    delete = "60m"
  }
}