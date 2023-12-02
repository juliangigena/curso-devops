output "ip_servidor" {
  value       = azurerm_public_ip.devops-publicip.ip_address
  description = "IP de conexion al servidor creado"
}