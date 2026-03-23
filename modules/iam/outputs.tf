output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}
output "eks_nodegroup_role_arn" {
  value = aws_iam_role.eks_nodegroup_role.arn
}

output "cluster_policy_attachments" {
  value = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKS_VPC_ResourceController,
  ]
}

output "nodegroup_policy_attachments" {
  value = [
    aws_iam_role_policy_attachment.nodegroup_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodegroup_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodegroup_AmazonEC2ContainerRegistryReadOnly,
  ]
}