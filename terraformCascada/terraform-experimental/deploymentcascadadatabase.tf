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
            value = var.env_vars["MYSQL_ROOT_PASSWORD"]
          }
          env {
            name  = "MYSQL_DATABASE"
            value = var.env_vars["MYSQL_DATABASE"]
          }
        }
      }
    }
  }
}