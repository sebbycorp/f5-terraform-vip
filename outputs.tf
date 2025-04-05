output "virtual_server_address" {
  value       = var.vip_address
  description = "The IP address of the virtual server"
}

output "virtual_server_port" {
  value       = var.vip_port
  description = "The port of the virtual server"
}

output "virtual_server_url" {
  value       = "http://${var.vip_address}:${var.vip_port}"
  description = "URL to access the application"
}

output "tenant" {
  value       = var.tenant_name
  description = "The AS3 tenant name"
}

output "application" {
  value       = var.application_name
  description = "The AS3 application name"
}
