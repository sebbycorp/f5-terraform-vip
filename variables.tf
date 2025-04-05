variable "bigip_address" {
  type        = string
  description = "The address of the BIG-IP instance"
  default     = "172.16.10.10"
}

variable "vault_address" {
  type        = string
  description = "The address of the Vault server"
  default     = "http://127.0.0.1:8200"
}

variable "vault_token" {
  type        = string
  description = "Token for accessing HashiCorp Vault"
  sensitive   = true
  default     = "root"
}

variable "tenant_name" {
  type        = string
  description = "AS3 tenant name"
  default     = "Common"
}

variable "application_name" {
  type        = string
  description = "AS3 application name"
  default     = "juiceshop_app"
}

variable "vip_address" {
  type        = string
  description = "Virtual server IP address"
  default     = "172.16.20.100"
}

variable "vip_port" {
  type        = number
  description = "Virtual server port"
  default     = 80
}

variable "pool_name" {
  type        = string
  description = "Backend pool name"
  default     = "juiceshop_pool"
}

variable "pool_members" {
  type = list(object({
    serverAddresses = list(string)
    servicePort     = number
  }))
  description = "List of pool members with their IP addresses and service port"
  default = [
    {
      serverAddresses = ["192.168.0.10", "192.168.0.11"]
      servicePort     = 80
    }
  ]
}

variable "internal_vlan" {
  type        = string
  description = "Internal VLAN name"
  default     = "internal"
}

variable "external_vlan" {
  type        = string
  description = "External VLAN name"
  default     = "external"
}
