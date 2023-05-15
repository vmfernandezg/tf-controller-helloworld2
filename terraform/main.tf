resource "azurerm_resource_group" "mi_resource_group" {
  name     = "prueba-terraform"
  location = "North Europe"
}

module "webapp" {
  source              = "./modules/webapp"

  resource_group_name = azurerm_resource_group.mi_resource_group.name
  location            = azurerm_resource_group.mi_resource_group.location
  #tier                = "Standard"
  tier                = "Premium"
  #size                = "S1"
  size                = "P1V3"
  capacity            = "3"
}