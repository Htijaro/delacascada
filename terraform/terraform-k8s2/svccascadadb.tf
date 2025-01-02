resource "kubernetes_service" "mysql_service" {
  metadata {
    name = "mysql-service"
  }

  spec {
    selector = {
      app = "dbh2o"
    }

    port {
      port        = 3306
      target_port = 3306
      node_port   = 30036
    }

    type = "NodePort"
  }
}
