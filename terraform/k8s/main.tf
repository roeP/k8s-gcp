data "google_client_config" "default" {}


data "google_container_cluster" "tunity-cluster-data" {
  name   = "${var.cluster_name}"
  location   = "${var.region}"
}


provider "kubernetes" {
  load_config_file = false

  host                   = "https://${data.google_container_cluster.tunity-cluster-data.endpoint}"
  token                  = "${data.google_client_config.default.access_token}"
  username               = "${var.username}"
  password               = "${var.password}"
  #client_certificate     = "${base64decode(var.client_certificate)}"
  #client_key             = "${base64decode(var.client_key)}"
  cluster_ca_certificate = "${base64decode(data.google_container_cluster.tunity-cluster-data.master_auth.0.cluster_ca_certificate)}"
}