terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.8.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "aztf-backend-rg"
    storage_account_name = "aztfconnectivity63"
    container_name       = "terraform"
    key                  = "tfstate"
    use_oidc             = true
    subscription_id      = "2745b794-365d-4993-9eec-fe3f9879434b"
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}