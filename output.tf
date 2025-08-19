output "resource_group_name" {
value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
value = azurerm_resource_group.rg.location
}

output "postgres_connection_string" {
  value = "postgresql://${var.admin_name}:${var.admin_pass}@${azurerm_postgresql_flexible_server.post.fqdn}:5432/${azurerm_postgresql_flexible_server_database.postdb.name}"
  sensitive = true
}

