resource "azurerm_resource_group" "mi_resource_group" {
  name     = "prueba-terraform"
  location = "North Europe"
  
  tags = {
      Environment = "Terraform Getting Started"
      Team = "DevOps"
  }
}

module "webapp" {
  source              = "./modules/webapp"

  resource_group_name = azurerm_resource_group.mi_resource_group.name
  location            = azurerm_resource_group.mi_resource_group.location
  #tier                = "Standard"
  tier                = "PremiumV3"
  #size                = "S1"
  size                = "P1v3"
  capacity            = "3"
}
