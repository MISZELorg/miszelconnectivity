output "vm_id" {
  description = "The ID of the Windows Virtual Machine."
  value       = azurerm_windows_virtual_machine.compute.id
}

output "nic_id" {
  description = "The ID of the Network Interface."
  value       = azurerm_network_interface.compute.id
}
