resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "static_web_app" {
  source              = "./modules/static-web-app"
  name                = var.static_web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
}
