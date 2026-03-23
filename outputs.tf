output "cluster_name" {
  value = var.create_eks ? module.eks[0].cluster_name : null
}

output "endpoint" {
  value = var.create_eks ? module.eks[0].cluster_endpoint : null
}

output "cluster_certificate" {
  value     = var.create_eks ? module.eks[0].cluster_certificate : null
  sensitive = true
}

output "cluster_sg" {
  value = var.create_securitygroups ? module.securitygroups[0].cluster_sg_id : null
}

output "node_group_name" {
  value = var.create_nodegroup ? module.nodegroup[0].node_group_name : null
}

output "kubeconfig" {
  value = var.create_eks ? "aws eks update-kubeconfig --region ${var.regiao} --name ${module.eks[0].cluster_name}" : null
}