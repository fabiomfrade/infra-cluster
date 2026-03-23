variable "project_name" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "nodegroup_role_arn" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "node_instance_type" {
  type = string
}
variable "desired_capacity" {
  type = number
}
variable "min_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "nodegroup_policy_attachments" {
  type = any
}