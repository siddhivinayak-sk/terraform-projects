resource "random_id" "rg_name" {
  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  location = var.location
  name     = "test-${random_id.rg_name.hex}-rg"
  tags = {
    createdBy = "SKT"
  }
}

resource "azurerm_resource_group" "example2" {
  location = var.location
  name     = "test2-${random_id.rg_name.hex}-rg"
  tags = {
    createdBy = "SKT"
  }
}


module "vnet" {
  source              = "./vnet"
  resource_group_name = azurerm_resource_group.example.name
  use_for_each        = var.use_for_each
  vnet_location       = var.vnet_location
}

