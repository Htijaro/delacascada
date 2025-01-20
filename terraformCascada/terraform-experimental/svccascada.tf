resource "kubernetes_service" "delacascada_service" {
  metadata {
    name = "delacascada-service"
  }

  spec {
    selector = {
      app = "delacascada"
    }

    port {
      port        = 8000
      target_port = 8000
      node_port   = 30088
    }

    type = "NodePort"
  }
}
