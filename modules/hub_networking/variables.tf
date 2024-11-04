variable "subnets" {
  description = "Map of subnets with their names and address prefixes"
  type = map(object({
    address_prefix = string
  }))
}

variable "hub_prefix" {
  description = "Prefix for the hub resources."
  type        = string
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
  default     = {}
}

variable "hub_vnet_cidr" {
  description = "CIDR block for the hub VNET."
  type        = list(string)
}