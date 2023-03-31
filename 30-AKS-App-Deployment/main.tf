provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "myk8scluster"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "myapp"
  }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    namespace = kubernetes_namespace.example.metadata.0.name
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 5

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "amitvashist7/mypython-web-app:v4"
          name  = "example"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 8081

            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "example" {
  metadata {
    name = "terraform-example"
    namespace = kubernetes_namespace.example.metadata.0.name
  }
  spec {
    selector = {
      test = kubernetes_deployment.example.metadata.0.labels.test
    }
    port {
      port        = 80
      target_port = 8081
    }

    type = "LoadBalancer"
  }
}
