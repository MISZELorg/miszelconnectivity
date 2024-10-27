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

variable "subnets" {
  description = "Map of subnets with names and CIDR blocks"
  type = map(object({
    name     = string
    cidr     = string
    nsg_name = string
  }))
  default = {
    hub_firewall = {
      name     = "AzureFirewallSubnet"
      cidr     = var.firewall_subnet_cidr
      nsg_name = "hub_firewall_nsg"
    },
    hub_gateway = {
      name     = "GatewaySubnet"
      cidr     = var.gateway_subnet_cidr
      nsg_name = "hub_gateway_nsg"
    },
    hub_bastion = {
      name     = "AzureBastionSubnet"
      cidr     = var.bastion_subnet_cidr
      nsg_name = "hub_bastion_nsg"
    },
    hub_infra = {
      name     = "infrasubnet"
      cidr     = var.infra_subnet_cidr
      nsg_name = "hub_infra_nsg"
    },
    hub_dev = {
      name     = "devsubnet"
      cidr     = var.dev_subnet_cidr
      nsg_name = "hub_dev_nsg"
    }
  }
}