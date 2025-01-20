resource "kubernetes_deployment" "delacascadadpl" {
  metadata {
    name = "delacascada"
    labels = {
      app = "delacascada"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "delacascada"
      }
    }

    template {
      metadata {
        labels = {
          app = "delacascada"
        }
      }

      spec {
        container {
          name  = "cascada"
          image = "htijaro/cascada:latest"
          command = [
            "sh", "-c", "sleep 60 && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"
          ]
          env {
            name  = "DATABASE_HOST"
            value = "mysql-service"
          }
        }
      }
    }
  }
}