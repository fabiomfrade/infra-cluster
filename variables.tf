# --- Flags de controle ---
variable "create_subnet_infra" {
  type    = bool
  default = true
}
variable "create_iam" {
  type    = bool
  default = true
}
variable "create_securitygroups" {
  type    = bool
  default = true
}
variable "create_eks" {
  type    = bool
  default = true
}
variable "create_nodegroup" {
  type    = bool
  default = true
}

# --- Fallbacks para recursos pré-existentes ---
variable "existing_vpc_id" {
  type    = string
  default = ""
}
variable "existing_cluster_role_arn" {
  type    = string
  default = ""
}
variable "existing_nodegroup_role_arn" {
  type    = string
  default = ""
}
variable "existing_private_subnet_ids" {
  type    = list(string)
  default = []
}
variable "existing_public_subnet_ids" {
  type    = list(string)
  default = []
}
variable "existing_cluster_sg_id" {
  type    = string
  default = ""
}
variable "existing_cluster_name" {
  type    = string
  default = ""
}

# --- Variáveis originais (mantidas) ---
variable "regiao" {
  type = string
}
variable "perfil" {
  type    = string
  default = "default"
}
variable "project_name" {
  type    = string
  default = "meu-eks"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "private_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}
variable "eks_cluster_version" {
  type    = string
  default = "1.33"
}
variable "node_instance_type" {
  type    = string
  default = "t3.medium"
}
variable "desired_capacity" {
  type    = number
  default = 3
}
variable "min_size" {
  type    = number
  default = 3
}
variable "max_size" {
  type    = number
  default = 6
}