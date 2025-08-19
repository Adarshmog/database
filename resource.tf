resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_postgresql_flexible_server" "post" {
  name                   = var.post
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  version                = "13"
  administrator_login    = var.admin_name
  administrator_password = var.admin_pass
  storage_mb             = 32768
  sku_name               = "GP_Standard_D2s_v3"
}

resource "azurerm_postgresql_flexible_server_database" "postdb" {
  name      = var.postdb
  server_id = azurerm_postgresql_flexible_server.post.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}
