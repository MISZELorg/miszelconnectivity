variable "location" {
  description = "Azure region for the resources."
  type        = string
}

variable "hub_tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
}

variable "hub_prefix" {
  description = "Prefix for the hub resources."
  type        = string
}

variable "hub_vnet_cidr" {
  description = "CIDR block for the hub VNET."
  type        = list(string)
}

variable "bastion_subnet_cidr" {
  description = "CIDR block for the bastion subnet."
  type        = list(string)
}

variable "firewall_subnet_cidr" {
  description = "CIDR block for the firewall subnet."
  type        = list(string)
}

variable "gateway_subnet_cidr" {
  description = "CIDR block for the gateway subnet."
  type        = list(string)
}

variable "infra_subnet_cidr" {
  description = "CIDR block for the infra subnet."
  type        = list(string)
}

variable "dev_subnet_cidr" {
  description = "CIDR block for the dev subnet."
  type        = list(string)
}

variable "dns_servers" {
  description = "DNS servers for the virtual network."
  type        = list(string)
  default     = null
}

variable "admin_username" {
  description = "jumphost user"
  type        = string
}

variable "keys" {
  description = "jumphost keys"
  type        = string
}