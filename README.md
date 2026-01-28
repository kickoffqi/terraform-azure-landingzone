# Azure Landing Zone Foundation

This project provides a modularized Terraform framework to deploy a production-ready Azure Landing Zone. It includes automated networking, centralized monitoring, and a secure, autoscaling AKS cluster.

## 1. Prerequisites
- **Terraform** >= 1.0
- **Azure CLI** (authenticated via `az login`)
- **kubectl** for cluster management

## 2. How to Deploy

### Step 1: Initialize
Initialize the working directory and download the required providers.
```bash
terraform init

### Step 2: Configure Variables
Create your local configuration file. Never commit this file to version control.

cp terraform.tfvars.example terraform.tfvars

Update terraform.tfvars with your specific Subscription IDs, CIDRs, and naming conventions.

### Step 3: Plan and Apply
Preview the changes before making them.

terraform plan
terraform apply

## 3. Design Decisions & Best Practices
Multi-Resource Group Strategy
Why: We decouple resources (Network, AKS, Monitoring) into separate Resource Groups.

Benefit: This enables Role-Based Access Control (RBAC) at the resource level, limits the "blast radius" during deletions, and follows the Azure Well-Architected Framework for management boundaries.

Remote State Management (Recommended)
Why: While this project can run locally, it is designed to use a remote backend (e.g., Azure Blob Storage).

Benefit: This provides a Single Source of Truth, prevents state corruption during concurrent runs, and allows team collaboration through state locking.

Cluster Autoscaling
Why: The default node pool is configured with auto_scaling_enabled = true.

Benefit: It ensures high availability during traffic spikes while optimizing costs by scaling down during idle periods.

Managed Microsoft Entra ID (AAD) RBAC
Why: We use AKS-managed Entra integration instead of local Kubernetes accounts.

Benefit:

Security: Eliminates the need to distribute static kubeconfig files.

Identity: Centralizes access management within Azure IAM, allowing you to use corporate identities for cluster operations.

Networking: Azure CNI
Why: We utilize Azure CNI instead of Kubenet.

Benefit: Every Pod gets a real IP from the VNet, enabling better performance and easier connectivity to on-premises resources or other VNets via peering.

## 4. Post-Deployment: Accessing the Cluster
Once the deployment is complete, use the following command to login via Entra ID:

az aks get-credentials --resource-group <aks_resource_group_name> --name <aks_cluster_name>

## 5. CI/CD Pipeline & DevSecOps

This project uses **GitHub Actions** to implement a "Shift-Left" approach to infrastructure quality. 

### Continuous Integration (CI)
Every Pull Request triggers a validation pipeline (`.github/workflows/terraform.yml`) that acts as a **Quality Gate**:
- **Linting**: Uses `terraform fmt` and `TFLint` to ensure code consistency and catch provider-specific misconfigurations.
- **Validation**: Runs `terraform validate` to check internal logic and variable consistency.
- **Security Scanning**: Integrates **Checkov** to perform Static Application Security Testing (SAST), identifying potential security risks (e.g., public access, missing encryption) before code is merged.

### Continuous Deployment (CD) - Roadmap
For production environments, the recommended CD flow is:
1. **OIDC Authentication**: Use Azure OpenID Connect (OIDC) to allow GitHub Actions to authenticate with Azure without storing long-lived Service Principal secrets.
2. **Environment Gates**: Utilize GitHub Environments with "Required Reviewers" for any `terraform apply` on production branches.
3. **Plan Output**: Comments the `terraform plan` output directly onto the PR for peer review.