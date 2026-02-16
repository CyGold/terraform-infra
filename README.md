# Azure Static Web App - Terraform Infrastructure

This Terraform configuration deploys an Azure Static Web App with a modular structure.

## Features

- ✅ Azure Static Web App deployment
- ✅ Resource Group creation
- ✅ Configurable SKU (Free or Standard)
- ✅ Custom tags support
- ✅ Deployment token output for CI/CD

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.6.0
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated
- Azure subscription

## Quick Start

1. **Authenticate with Azure:**
   ```bash
   az login
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Review the plan:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

## Configuration

### Variables

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `resource_group_name` | Name of the resource group | `women-techsters` | No |
| `location` | Azure region | `East US` | No |
| `app_name` | Name of the static web app | `FIXR` | No |
| `sku_tier` | SKU tier (Free or Standard) | `Free` | No |
| `sku_size` | SKU size (Free or Standard) | `Free` | No |
| `subscription_id` | Azure subscription ID | - | Yes |
| `tags` | Resource tags | `{Environment="dev", project="FIXR"}` | No |

### Customizing Variables

Create a `terraform.tfvars` file:

```hcl
app_name            = "my-static-app"
resource_group_name = "my-resource-group"
location            = "West Europe"
sku_tier            = "Standard"
sku_size            = "Standard"
subscription_id     = "your-subscription-id"

tags = {
  Environment = "production"
  Project     = "MyProject"
  Owner       = "DevOps Team"
}
```

## Outputs

After deployment, Terraform will output:

- `static_web_app_url` - Full HTTPS URL of your static web app
- `static_web_app_hostname` - Hostname of the static web app
- `static_web_app_id` - Azure resource ID
- `deployment_token` - Sensitive API key for deployments (use in CI/CD)

## Deploying Your App

After infrastructure is created, retrieve the deployment token:

```bash
terraform output -raw deployment_token
```

Use this token in your CI/CD pipeline (GitHub Actions, Azure DevOps, etc.) to deploy your static content.

### Example GitHub Actions Workflow

```yaml
name: Deploy Static Web App

on:
  push:
    branches: [ main ]

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Build And Deploy
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/" # App source code path
          output_location: "build" # Built app content directory
```

## Module Structure

```
terraform-infra/
├── main.tf              # Root module - calls the static-web-app module
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── providers.tf         # Provider configuration
└── modules/
    └── static-web-app/
        ├── main.tf      # Static Web App resource definition
        ├── variables.tf # Module variables
        └── outputs.tf   # Module outputs
```

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

## SKU Options

- **Free**: No cost, includes 100 GB bandwidth/month, custom domains, and SSL
- **Standard**: Paid tier with SLA, 100 GB bandwidth included, additional features

## License

MIT
# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Deploy infrastructure
terraform apply

# Get your app URL
terraform output static_web_app_url

# Get deployment token for CI/CD
terraform output -raw deployment_token