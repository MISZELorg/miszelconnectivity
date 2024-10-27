# variable "admin_username" {
#   description = "The administrator username for the VM."
#   type        = string
#   default     = "sysadmin"
# }

# variable "admin_password" {
#   description = "The administrator password for the VM."
#   type        = string
# }

# variable "server_name" {
#   description = "The name of the server."
#   type        = string
# }

# variable "resource_group_name" {
#   description = "The name of the resource group."
#   type        = string
# }

# variable "location" {
#   description = "The Azure location for the resources."
#   type        = string
# }

# variable "vnet_subnet_id" {
#   description = "The ID of the subnet to deploy the VM in."
#   type        = string
# }

# variable "os_publisher" {
#   description = "The publisher of the OS image."
#   type        = string
#   default     = "canonical"
# }

# variable "os_offer" {
#   description = "The offer of the OS image."
#   type        = string
#   default     = "0001-com-ubuntu-server-focal"
# }

# variable "os_sku" {
#   description = "The SKU of the OS image."
#   type        = string
#   default     = "20_04-lts-gen2"
# }

# variable "os_version" {
#   description = "The version of the OS image."
#   type        = string
#   default     = "latest"
# }

# variable "disable_password_authentication" {
#   description = "Set to true if using SSH key, false if using password."
#   type        = bool
#   default     = false
# }

# variable "enable_accelerated_networking" {
#   description = "Set to true to enable accelerated networking."
#   type        = bool
#   default     = false
# }

# variable "storage_account_type" {
#   description = "The type of storage account for the OS disk."
#   type        = string
#   default     = "Standard_LRS"
# }

# variable "vm_size" {
#   description = "The size of the VM."
#   type        = string
#   default     = "Standard_D2s_v3"
# }

# variable "tags" {
#   description = "A map of tags to assign to the resources."
#   type        = map(string)
#   default = {
#     application = "compute"
#   }
# }


# # variable "admin_username" {
# #   default = "sysadmin"
# # }

# # variable "admin_password" {
# #   default = "changeme"
# # }

# # variable "server_name" {}

# # variable "resource_group_name" {}

# # variable "location" {}

# # variable "vnet_subnet_id" {}
# # variable "os_publisher" {
# #   default = "canonical"
# # }
# # variable "os_offer" {
# #   default = "0001-com-ubuntu-server-focal"
# # }
# # variable "os_sku" {
# #   default = "20_04-lts-gen2"
# # }
# # variable "os_version" {
# #   default = "latest"
# # }
# # variable "disable_password_authentication" {
# #   default = false #leave as true if using ssh key, if using a password make the value false
# # }
# # variable "enable_accelerated_networking" {
# #   default = "false"
# # }
# # variable "storage_account_type" {
# #   default = "Standard_LRS"
# # }
# # variable "vm_size" {
# #   default = "Standard_D2s_v3"
# # }
# # variable "tags" {
# #   type = map(string)

# #   default = {
# #     application = "compute"
# #   }
# # }

# # variable "allocation_method" {
# #   default = "Static"
# # }