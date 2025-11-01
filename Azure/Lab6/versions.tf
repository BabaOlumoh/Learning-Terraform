terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.49.0"
    }

    random = {
    source = "hashicorp/random"
    version = "~> 3.6.3"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "~>3.6.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets = true
    }
  }
}