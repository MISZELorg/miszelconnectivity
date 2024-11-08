variable "admin_username" {
  description = "The administrator username for the Windows VM."
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The administrator password for the Windows VM."
  type        = string
}

variable "server_name" {
  description = "The name of the Windows server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location for the resources."
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet to deploy the VM in."
  type        = string
}

variable "storage_account_type" {
  description = "The type of storage account for the OS disk."
  type        = string
  default     = "Standard_LRS"
}

variable "vm_size" {
  description = "The size of the Windows VM."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    application = "compute"
  }
}
