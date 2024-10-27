variable "location" {
  description = "Location for the bastion resources."
  type        = string
}
variable "network_watcher_name" {
  description = "The name of the Network Watcher."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the storage account to store the flow logs."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace for traffic analytics."
  type        = string
}

variable "workspace_region" {
  description = "The region of the Log Analytics Workspace."
  type        = string
}
