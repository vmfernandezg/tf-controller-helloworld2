resource "azurerm_app_service_plan" "mi_app_service_plan" {
  name                = "prueba-terraform-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  #kind                = "Windows"
  #reserved            = false
  kind                = "Linux"
  reserved            = true
  #maximum_elastic_worker_count  = 3
  zone_redundant      = true              # IMPORTANTE HA
  #per_site_scaling    = true              # IMPORTANTE PERF

  sku {
    tier      = var.tier
    size      = var.size
    capacity  = var.capacity
  }
}

resource "azurerm_app_service" "mi_app_service" {
  name                = "prueba-terraform-web"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.mi_app_service_plan.id
 
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  #site_config {
    #number_of_workers = "3"               # IMPORTANTE PERF
  #}

}