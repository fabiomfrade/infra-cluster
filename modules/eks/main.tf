resource "aws_eks_cluster" "this" {
  name     = var.project_name
  role_arn = var.cluster_role_arn
  version  = var.eks_cluster_version

  vpc_config {
    subnet_ids              = concat(var.private_subnet_ids, var.public_subnet_ids)
    security_group_ids      = [var.cluster_sg_id]
    endpoint_public_access  = true
    endpoint_private_access = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [var.cluster_policy_attachments]

  tags = { Name = var.project_name }
}