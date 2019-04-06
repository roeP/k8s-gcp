#------ main root variables

variable "project" {}
variable "region" {
  default = "us-east1"
}

#------ docker variables
variable "image_name" {}

#-------gke variables
variable "cluster_name" {}
variable "cluster_master_count" {
  default = 1
}
variable "node_pool_name" {}
variable "node_count" {
  default = 3
}
variable "machine_type" {}
variable "username" {
  default = ""
}
variable "password" {
  default = ""
}
variable "min_node_count" {}

variable "max_node_count" {}

#-------k8s variables

variable "deployment_name" {}
variable "replicas" {}
variable "container_name" {}


