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
            name  = "DATABASE_NAME"
            value = "dbh2o"
          }
          env {
            name  = "DATABASE_USER"
            value = "myuser"
          }
          env {
            name  = "DATABASE_PASSWORD"
            value = "ubuntu08-"
          }
          env {
            name  = "DATABASE_PORT"
            value = "3306"
          }
          # Aquí apuntamos al servicio MySQL en otro archivo.
          env {
            name = "DATABASE_HOST"
            value = "mysql-service"  # Nombre del servicio MySQL desde el archivo database.tf
          }
          port {
            container_port = 8000
          }
        }
      }
    }
  }
}