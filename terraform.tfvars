location      = "northeurope"
hub_prefix    = "aztf-hub"
hub_vnet_cidr = ["10.0.0.0/16"]

subnets = {
  "AzureFirewallSubnet" = { address_prefix = "10.0.1.0/26" }
  "GatewaySubnet"       = { address_prefix = "10.0.2.0/27" }
  "AzureBastionSubnet"  = { address_prefix = "10.0.3.0/26" }
  "InfraSubnet"         = { address_prefix = "10.0.4.0/24" }
  "DevSubnet"           = { address_prefix = "10.0.5.0/24" }
}

hub_tags = {
  Environment = "Dev"
  Owner       = "kmiszel"
  Source      = "Terraform"
  # Git         = "Github"
  # Purpose     = "Hub"
}