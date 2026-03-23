variable "project_name" {
  type = string
}
variable "eks_cluster_version" {
  type = string
}
variable "cluster_role_arn" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "cluster_sg_id" {
  type = string
}
variable "cluster_policy_attachments" {
  type = any
}