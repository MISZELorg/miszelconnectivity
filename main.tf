# Hub - module creates RG, VNet and Subnets.
module "hub_network" {
  source = "./modules/hub_network"

  hub_prefix           = var.hub_prefix
  location             = var.location
  hub_tags             = var.hub_tags
  hub_vnet_cidr        = var.hub_vnet_cidr
  dns_servers          = var.dns_servers
  firewall_subnet_cidr = var.firewall_subnet_cidr
  gateway_subnet_cidr  = var.gateway_subnet_cidr
  bastion_subnet_cidr  = var.bastion_subnet_cidr
  infra_subnet_cidr    = var.infra_subnet_cidr
  dev_subnet_cidr      = var.dev_subnet_cidr
}

module "dev_nsg" {
  source              = "./modules/nsg"
  vnet_name           = module.hub_network.hub_vnet_name
  subnet_name         = module.hub_network.hub_dev_subnet_name
  resource_group_name = module.hub_network.hub_rg_name
  location            = var.location
  subnet_id           = module.hub_network.hub_dev_subnet_id
  depends_on = [
    module.hub_network
  ]
}

module "infra_nsg" {
  source              = "./modules/nsg"
  vnet_name           = module.hub_network.hub_vnet_name
  subnet_name         = module.hub_network.hub_infra_subnet_name
  resource_group_name = module.hub_network.hub_rg_name
  location            = var.location
  subnet_id           = module.hub_network.hub_infra_subnet_id
  depends_on = [
    module.hub_network
  ]
}

# Bastion - module creates public IP and Bastion in dedicated Subnet.
module "bastion" {
  source = "./modules/bastion"

  subnet_cidr          = var.bastion_subnet_cidr
  virtual_network_name = module.hub_network.hub_vnet_name
  resource_group_name  = module.hub_network.hub_rg_name
  location             = var.location
  subnet_id            = module.hub_network.hub_bastion_subnet_id
  depends_on = [
    module.hub_network
  ]
}

# AKS FW rules - module creates fw rules for AKS cluster.
module "firewall_rules" {
  source              = "./modules/firewall_rules"
  resource_group_name = module.hub_network.hub_rg_name
  location            = var.location
  depends_on = [
    module.hub_network
  ]
}

# Firewall - module creates public IP and Firewall in dedicated Subnet.
module "firewall" {
  source               = "./modules/firewall"
  resource_group_name  = module.hub_network.hub_rg_name
  location             = var.location
  virtual_network_name = module.hub_network.hub_vnet_name
  firewall_policy_id   = module.firewall_rules.fw_policy_id
  subnet_id            = module.hub_network.hub_firewall_subnet_id
  depends_on = [
    module.hub_network
  ]
}

# module "linux_vm" {
#   source                          = "./modules/linux_vm"
#   server_name                     = "jumphost"
#   resource_group_name             = module.hub_network.hub_rg_name
#   location                        = var.location
#   vnet_subnet_id                  = module.hub_network.hub_dev_subnet_id
#   admin_username                  = var.admin_username
#   admin_password                  = var.keys
#   vm_size                         = "Standard_D2s_v3"
#   disable_password_authentication = false
#   enable_accelerated_networking   = true
#   depends_on = [
#     module.hub_network
#   ]
# }