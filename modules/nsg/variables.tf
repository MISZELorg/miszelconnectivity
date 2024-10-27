variable "vnet_name" {
  description = "The name of the virtual network, used to generate the NSG name."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet, used to generate the NSG name."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name for the NSG."
  type        = string
}

variable "location" {
  description = "The location for the NSG."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the NSG."
  type        = string
}