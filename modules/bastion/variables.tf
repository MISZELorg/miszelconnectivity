variable "location" {
  description = "Location for the bastion resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group for the bastion."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network to base the bastion name on."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the bastion."
  type        = string
}