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

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_app_service_plan.azurerm_app_service.id
  repo_url           = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  branch             = "master"
  use_manual_integration = true
  use_mercurial      = false
}
