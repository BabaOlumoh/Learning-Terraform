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
    
  }
}