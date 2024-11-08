# Hub - module creates RG, VNet and Subnets.
module "hub_networking" {
  source = "./modules/hub_networking"

  hub_prefix    = var.hub_prefix
  location      = var.location
  tags          = var.hub_tags
  hub_vnet_cidr = var.hub_vnet_cidr
  subnets       = var.subnets
}

# Bastion - module creates public IP and Bastion in dedicated Subnet.
module "bastion" {
  source = "./modules/bastion"

  subnet_cidr          = var.subnets["AzureBastionSubnet"].address_prefix
  virtual_network_name = module.hub_networking.hub_vnet_name
  resource_group_name  = module.hub_networking.hub_rg_name
  location             = module.hub_networking.location
  subnet_id            = module.hub_networking.subnet_ids["AzureBastionSubnet"]
  tags                 = var.hub_tags
  depends_on = [
    module.hub_networking
  ]
}

# AKS FW rules - module creates fw rules for AKS cluster.
module "firewall_rules" {
  source = "./modules/firewall_rules"

  resource_group_name = module.hub_networking.hub_rg_name
  location            = module.hub_networking.location
  depends_on = [
    module.hub_networking
  ]
}

# Firewall - module creates public IP and Firewall in dedicated Subnet.
module "firewall" {
  source = "./modules/firewall"

  resource_group_name  = module.hub_networking.hub_rg_name
  location             = module.hub_networking.location
  virtual_network_name = module.hub_networking.hub_vnet_name
  firewall_policy_id   = module.firewall_rules.fw_policy_id
  subnet_id            = module.hub_networking.subnet_ids["AzureFirewallSubnet"]
  tags                 = var.hub_tags
  depends_on = [
    module.hub_networking
  ]
}

# Jumphost - module creates Linux VM in dedicated Subnet.
module "linux_vm" {
  source = "./modules/linux_vm"

  server_name                     = "jumphost"
  resource_group_name             = module.hub_networking.hub_rg_name
  location                        = module.hub_networking.location
  vnet_subnet_id                  = module.hub_networking.subnet_ids["DevSubnet"]
  admin_username                  = var.admin_username
  admin_password                  = var.keys
  vm_size                         = "Standard_D2s_v3"
  disable_password_authentication = false
  enable_accelerated_networking   = true
  tags                            = var.hub_tags
  depends_on = [
    module.hub_networking
  ]
}

# # module "network_watcher" {
# #   source                        = "./network_watcher"

# #   network_watcher_name         = "NetworkWatcher_${var.location}"
# #   resource_group_name          = "NetworkWatcherRG"
# #   storage_account_id           = "<your_storage_account_id>"
# #   log_analytics_workspace_id    = "<your_log_analytics_workspace_id>"
# #   workspace_region             = var.location
# # }