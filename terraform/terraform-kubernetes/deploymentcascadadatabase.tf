resource "kubernetes_deployment" "dbh2odpl" {
  metadata {
    name = "dbh2o"
    labels = {
      app = "dbh2o"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "dbh2o"
      }
    }

    template {
      metadata {
        labels = {
          app = "dbh2o"
        }
      }

      spec {
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
