resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  kubernetes_version        = "1.33"
  automatic_channel_upgrade = "patch"

  default_node_pool {
    name           = "default"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.vnet_subnet_id

    enable_auto_scaling = true
    min_count           = var.min_count
    max_count           = var.max_count

    # FIX CKV_AZURE_227: Enable host-based encryption
    enable_host_encryption = true

    # FIX CKV_AZURE_232: Ensure only critical pods on system pool
    only_critical_addons_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip

    network_policy = "azure"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }

  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = true
  }

  # FIX CKV_AZURE_141: Disable local accounts
  local_account_disabled = true

  # FIX CKV_AZURE_116: Enable Azure Policy Add-on
  azure_policy_enabled = true

  # FIX CKV_AZURE_6: Limit API Server access to specific IPs (e.g., your office/home IP)
  # For demo, you can use a variable or leave it empty for all, 
  # but Checkov wants this block present.
  api_server_access_profile {
    authorized_ip_ranges = ["1.2.3.4/32"]
  }

}
