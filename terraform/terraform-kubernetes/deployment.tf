resource "kubernetes_deployment" "cascadadpl" {
  metadata {
    name = "cascada"
    labels = {
      app = "cascada"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "cascada"
      }
    }

    template {
      metadata {
        labels = {
          app = "cascada"
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
          env {
            name = "DATABASE_HOST"
            value_from {
              field_ref {
                field_path = "status.podIP"
              }
            }
          }
          port {
            container_port = 8000
          }
        }

        container {
          name  = "dbh2o"
          image = "htijaro/mysql:latest"
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "v3R02011$"
          }
          env {
            name  = "MYSQL_DATABASE"
            value = "dbh2o"
          }
          env {
            name  = "MYSQL_USER"
            value = "myuser"
          }
          env {
            name  = "MYSQL_PASSWORD"
            value = "ubuntu08-"
          }
          port {
            container_port = 3306
          }
        }
      }
    }
  }
}
