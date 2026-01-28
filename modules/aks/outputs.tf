output "aks_id" {
  description = "The ID of the AKS Cluster"
  value       = azurerm_kubernetes_cluster.this.id
}

output "aks_name" {
  description = "The Name of the AKS Cluster"
  value       = azurerm_kubernetes_cluster.this.name
}

output "kubelet_identity_object_id" {
  description = "The Object ID of the AKS Cluster Kubelet Identity"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

