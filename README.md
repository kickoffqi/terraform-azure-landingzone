# Azure Landing Zone with Terraform

## Project Goal
Deploy a standardized Azure Landing Zone including VNet, AKS, and Monitoring modules.

## Prerequisites
- Terraform >= 1.0
- Azure CLI
- Active Azure Subscription

## Quick Start
1. `az login`
2. `terraform init`
3. Edit `terraform.tfvars` with your specific CIDRs.
4. `terraform apply`

## Architecture
- **Network**: VNet (10.0.0.0/16) with dedicated AKS subnets.
- **Compute**: AKS Cluster with Azure CNI.
- **Monitoring**: Log Analytics Workspace with Container Insights.