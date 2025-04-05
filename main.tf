terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "~> 1.18.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.15.0"
    }
  }
  required_version = ">= 1.0.0"
}

# Configure the providers
provider "bigip" {
  address  = var.bigip_address
  username = data.vault_kv_secret_v2.f5_creds.data.username
  password = data.vault_kv_secret_v2.f5_creds.data.password
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

# Get F5 credentials from Vault
data "vault_kv_secret_v2" "f5_creds" {
  mount = "secret"
  name  = "f5"
}

# Deploy AS3 Declaration
resource "bigip_as3" "juiceshop_application" {
  as3_json = templatefile("${path.module}/templates/as3_declaration.json", {
    tenant_name      = var.tenant_name
    application_name = var.application_name
    vip_address      = var.vip_address
    vip_port         = var.vip_port
    pool_name        = var.pool_name
    pool_members     = jsonencode(var.pool_members)
    internal_vlan    = var.internal_vlan
    external_vlan    = var.external_vlan
  })
  depends_on = [data.vault_kv_secret_v2.f5_creds]
}
