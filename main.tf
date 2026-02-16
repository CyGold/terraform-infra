resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "static_web_app" {
  source              = "./modules/static-web-app"
  app_name            = var.app_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  tags                = var.tags
}