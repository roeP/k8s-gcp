
resource "kubernetes_namespace" "application" {
  metadata {
    annotations {
      name = "application"
    }

    labels {
      test = "app01"
    }

    name = "application"
  }
}

resource "kubernetes_deployment" "tunity_deployment" {
  metadata {
    name = "${var.deployment_name}"
    namespace = "application"
  }

  spec {
    replicas = "${var.replicas}"
    selector {
      match_labels {
        test = "app01"
      }
    }
    template {
      metadata {
        labels {
           test = "app01"
        }
      }

      spec {
        container {
          image = "${var.image_name}"
          name  = "${var.container_name}"
        }
      }
    }
  }
}