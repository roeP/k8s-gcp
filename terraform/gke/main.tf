#-----gke/main.tf

resource "google_container_cluster" "tunity-cluster" {
  name     = "${var.cluster_name}"
  location = "${var.region}"
  remove_default_node_pool = true #best practice
  initial_node_count = "${var.cluster_master_count}" #1 master in a regional cluster

  # Setting an empty username and password explicitly disables basic auth
  master_auth {
    username = "${var.username}"
    password = "${var.password}"
    
  }
}

resource "google_container_node_pool" "tunity-node-pool" {
  name       = "${var.node_pool_name}"
  location   = "${var.region}"
  cluster    = "${google_container_cluster.tunity-cluster.name}"
  node_count = "${var.node_count}"

  autoscaling {
    min_node_count = "${var.min_node_count}"
    max_node_count = "${var.max_node_count}"
  }

  node_config {
    preemptible  = false
    machine_type = "${var.machine_type}" 

    metadata {
      disable-legacy-endpoints = "true"
    }
  }
}
