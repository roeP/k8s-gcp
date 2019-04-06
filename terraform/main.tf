provider "google" {
  credentials = "${file("../auth/account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

module "docker"  {
  source = "./docker"
  image_name = "${var.image_name}"
}
module "gke" {
  source   = "./gke"
  cluster_name = "${var.cluster_name}"
  region = "${var.region}"
  cluster_master_count = "${var.cluster_master_count}"
  node_pool_name = "${var.node_pool_name}"
  node_count = "${var.node_count}"
  machine_type = "${var.machine_type}"
  username = "${var.username}"
  password = "${var.password}"
  min_node_count = "${var.min_node_count}"
  max_node_count = "${var.max_node_count}"
}

module "k8s" {
  source   = "./k8s"
  host     = "${module.gke.host}"
  username = "${var.username}"
  password = "${var.password}"
  client_certificate     = "${module.gke.client_certificate}"
  client_key             = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
  deployment_name = "${var.deployment_name}"
  replicas = "${var.replicas}"
  image_name = "${var.image_name}"
  container_name = "${var.container_name}"
  cluster_name = "${var.cluster_name}"
  region = "${var.region}"
}