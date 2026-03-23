module "subnet_infra" {
  source = "./modules/subnet_infra"
  count  = var.create_subnet_infra ? 1 : 0

  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
}

module "iam" {
  source = "./modules/iam"
  count  = var.create_iam ? 1 : 0

  project_name = var.project_name
}

module "securitygroups" {
  source = "./modules/securitygroups"
  count  = var.create_securitygroups ? 1 : 0

  project_name = var.project_name
  vpc_id       = var.create_subnet_infra ? module.subnet_infra[0].vpc_id : var.existing_vpc_id
}

module "eks" {
  source = "./modules/eks"
  count  = var.create_eks ? 1 : 0

  project_name               = var.project_name
  eks_cluster_version        = var.eks_cluster_version
  cluster_role_arn           = var.create_iam ? module.iam[0].eks_cluster_role_arn : var.existing_cluster_role_arn
  private_subnet_ids         = var.create_subnet_infra ? module.subnet_infra[0].private_subnet_ids : var.existing_private_subnet_ids
  public_subnet_ids          = var.create_subnet_infra ? module.subnet_infra[0].public_subnet_ids : var.existing_public_subnet_ids
  cluster_sg_id              = var.create_securitygroups ? module.securitygroups[0].cluster_sg_id : var.existing_cluster_sg_id
  cluster_policy_attachments = var.create_iam ? module.iam[0].cluster_policy_attachments : []
}

module "nodegroup" {
  source = "./modules/nodegroup"
  count  = var.create_nodegroup ? 1 : 0

  project_name                 = var.project_name
  cluster_name                 = var.create_eks ? module.eks[0].cluster_name : var.existing_cluster_name
  nodegroup_role_arn           = var.create_iam ? module.iam[0].eks_nodegroup_role_arn : var.existing_nodegroup_role_arn
  private_subnet_ids           = var.create_subnet_infra ? module.subnet_infra[0].private_subnet_ids : var.existing_private_subnet_ids
  node_instance_type           = var.node_instance_type
  desired_capacity             = var.desired_capacity
  min_size                     = var.min_size
  max_size                     = var.max_size
  nodegroup_policy_attachments = var.create_iam ? module.iam[0].nodegroup_policy_attachments : []
}