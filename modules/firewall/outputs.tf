output "firewall_id" {
  description = "ID of the Azure Firewall."
  value       = azurerm_firewall.firewall.id
}

output "firewall_public_ip" {
  description = "Public IP address of the Azure Firewall."
  value       = azurerm_public_ip.firewall.ip_address
}