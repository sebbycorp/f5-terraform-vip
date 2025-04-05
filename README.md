# F5 BIG-IP Terraform Configuration with AS3

This repository contains Terraform configuration to deploy a virtual server on F5 BIG-IP using Application Services 3 (AS3) extension. The configuration includes setting up a virtual server (VIP) with pool members.

## Features

- Integrates with HashiCorp Vault for secure credential management
- Uses AS3 declarations for F5 BIG-IP configuration
- Configures a virtual server with specific VLANs
- Sets up a pool with backend servers

## Prerequisites

- Terraform 1.0.0 or later
- F5 BIG-IP with AS3 extension installed
- HashiCorp Vault (optional, for credential management)

## F5 BIG-IP AS3 Requirements

- AS3 version 3.43.0 or later must be installed on the BIG-IP
- BIG-IP version 15.1.0 or later recommended

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/sebbycorp/f5-terraform-vip.git
   cd f5-terraform-vip
   ```

2. Initialize the Terraform project:
   ```bash
   terraform init
   ```

3. Review and modify the `terraform.tfvars` file with your specific configuration.

4. Set the Vault token as an environment variable for security (optional):
   ```bash
   export TF_VAR_vault_token="your-vault-token"
   ```

5. Review the plan:
   ```bash
   terraform plan
   ```

6. Apply the configuration:
   ```bash
   terraform apply
   ```

7. To destroy the resources:
   ```bash
   terraform destroy
   ```

## Configuration Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `bigip_address` | IP address of F5 BIG-IP device | `172.16.10.10` |
| `vault_address` | Address of HashiCorp Vault server | `http://127.0.0.1:8200` |
| `vault_token` | Token for Vault authentication | - |
| `tenant_name` | AS3 tenant name | `Common` |
| `application_name` | AS3 application name | `juiceshop_app` |
| `vip_address` | Virtual server IP address | `172.16.20.100` |
| `vip_port` | Virtual server port | `80` |
| `pool_name` | Backend pool name | `juiceshop_pool` |
| `pool_members` | List of pool members | See `variables.tf` |
| `internal_vlan` | Internal VLAN name | `internal` |
| `external_vlan` | External VLAN name | `external` |

## AS3 Declaration Structure

The AS3 declaration uses the following structure:
- Tenant: Specified by `tenant_name`
- Application: Specified by `application_name`
- Service_HTTP: Virtual server configuration including IP, port, and VLANs
- Pool: Backend server configuration

## Output Values

After successful application, you'll see outputs including:
- Virtual server address and port
- URL to access the application
- Tenant and application names from AS3

## License

This project is licensed under the MIT License - see the LICENSE file for details.
