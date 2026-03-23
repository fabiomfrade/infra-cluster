resource "aws_eks_node_group" "managed_nodes" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-managed-ng"
  node_role_arn   = var.nodegroup_role_arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = [var.node_instance_type]

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_size
    max_size     = var.max_size
  }

  disk_size = 20

  update_config {
    max_unavailable = 1
  }

  labels = { role = "worker" }

  tags = { Name = "${var.project_name}-managed-ng" }

  depends_on = [var.nodegroup_policy_attachments]
}