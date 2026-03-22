variable "regiao" {
  description = "Região a ser utilizada pelo provedor de serviço"
  type        = string
}

variable "perfil" {
  description = "Perfil de acesso a ser utilizado pelo provedor de serviço para conexão"
  type        = string
  default     = "default"
}

variable "project_name" {
  description = "Nome base do projeto (usado em nomes e tags)"
  type        = string
  default     = "meu-eks"
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "CIDRs das subnets públicas (deve conter 3 itens, um por AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets_cidrs" {
  description = "CIDRs das subnets privadas (deve conter 3 itens, um por AZ)"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "eks_cluster_version" {
  description = "Versão do EKS"
  type        = string
  default     = "1.33"
}

variable "node_instance_type" {
  description = "Tipo de instância dos nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Quantidade desejada de nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Quantidade mínima de nodes"
  type        = number
  default     = 3
}

variable "max_size" {
  description = "Quantidade máxima de nodes"
  type        = number
  default     = 6
}