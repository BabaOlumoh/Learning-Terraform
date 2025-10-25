terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.49.0"
    }
    
  }
  backend "azurerm" {  
    resource_group_name  = "rg-terraform-state-dev" 
    storage_account_name = "st0mwn6ematz"                              
    container_name       = "tfstate"                               
    key                  = "observability-dev"    
    }
}

provider "azurerm" {
  features {
    
  }
}