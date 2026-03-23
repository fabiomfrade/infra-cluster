resource "aws_security_group" "eks_cluster" {
  name        = "${var.project_name}-eks-cluster-sg"
  description = "Security group para o Control Plane EKS"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.project_name}-eks-cluster-sg" }
}

resource "aws_security_group" "eks_nodes" {
  name        = "${var.project_name}-eks-nodes-sg"
  description = "Security group para os worker nodes"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name                                        = "${var.project_name}-eks-nodes-sg"
    "kubernetes.io/cluster/${var.project_name}" = "owned"
  }
}

resource "aws_security_group_rule" "nodes_to_cluster_443" {
  type                     = "ingress"
  security_group_id        = aws_security_group.eks_cluster.id
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.eks_nodes.id
  description              = "Permite a comunicacao dos Worker nodes com o Control Plane - 443"
}

resource "aws_security_group_rule" "cluster_to_nodes_ephemeral_tcp" {
  type                     = "ingress"
  security_group_id        = aws_security_group.eks_nodes.id
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.eks_cluster.id
  description              = "Permite o Control Plane comunicar com os workers - 1025-65535"
}

resource "aws_security_group_rule" "nodes_to_nodes_all" {
  type              = "ingress"
  security_group_id = aws_security_group.eks_nodes.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
  description       = "Permite o trafego entre nodes"
}