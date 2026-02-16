module "static_web_app" {
  source              = "./modules/static-web-app"
  app_name                = var.app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  tags                = var.tags
}
