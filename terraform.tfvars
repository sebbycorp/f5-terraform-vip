bigip_address   = "172.16.10.10"
vault_address   = "http://127.0.0.1:8200"
# vault_token should be provided via environment variable or command line for security
# vault_token     = "root"

tenant_name     = "Common"
application_name = "juiceshop_app"
vip_address     = "172.16.20.100"
vip_port        = 80
pool_name       = "juiceshop_pool"
pool_members    = [
  {
    serverAddresses = ["192.168.0.10", "192.168.0.11"]
    servicePort     = 80
  }
]
internal_vlan   = "internal"
external_vlan   = "external"
