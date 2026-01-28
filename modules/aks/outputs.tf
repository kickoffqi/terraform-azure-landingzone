output "aks_id" {
  description = "The ID of the AKS Cluster"
  value       = azurerm_kubernetes_cluster.this.id
}

output "kub_config" {
  description = "The kube_config of the AKS Cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

