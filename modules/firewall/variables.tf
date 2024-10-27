variable "location" {
  description = "Location for the firewall resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for the firewall."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network to base the firewall name on."
  type        = string
}

variable "firewall_policy_id" {
  description = "ID of the firewall policy to associate with the firewall."
  type        = string
}

variable "sku_name" {
  description = "SKU name for the Azure Firewall."
  type        = string
  default     = "AZFW_VNet"
}

variable "sku_tier" {
  description = "SKU tier for the Azure Firewall."
  type        = string
  default     = "Standard"
}

variable "subnet_id" {
  description = "ID of the subnet for the firewall."
  type        = string
}