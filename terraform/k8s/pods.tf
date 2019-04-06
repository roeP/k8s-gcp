resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name = "nginx-tunity"

    labels {
      app  = "nginx"
      role = "master"
      tier = "backend"
}
  }

  spec {
    replicas = 1

    selector = {
      app  = "nginx"
      role = "master"
      tier = "backend"
}
    template {
      container {
        image = "${var.image_name}"
        name  = "${var.container_name}"

        port {
          container_port = 80
        }

        
      }
    }
  }
}
