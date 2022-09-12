# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "SQUIGGLE> 2.65"
    }  
  }
    required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}