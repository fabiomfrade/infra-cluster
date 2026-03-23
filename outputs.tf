# Retornos do cluster
output "cluster_name" {
  description = "Nome do cluster"
  value       = aws_eks_cluster.this.name
}

output "endpoint" {
  description = "Endpoint da API do cluster"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate" {
  description = "Certificado CA do cluster em base64"
  value       = aws_eks_cluster.this.certificate_authority[0].data
  sensitive   = true
}

output "cluster_sg" {
  description = "ID do SG do cluster"
  value       = aws_security_group.eks_cluster.id
}

# Retornos do Node Group

output "node_group_name" {
  description = "Nome do Node Group"
  value       = aws_eks_node_group.managed_nodes.node_group_name
}

# Helper para conexão com o cluster
output "kubeconfig" {
  description = "Comando para configurar o kubeconfig local"
  value       = "aws eks update-kubeconfig --region ${var.regiao} --name ${aws_eks_cluster.this.name}"
}