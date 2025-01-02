resource "kubernetes_service" "cascadasvc" {
  metadata {
    name = "cascada-service"
  }

  spec {
    selector = {
      app = "cascada"
    }

    port {
      port        = 8000
      target_port = 8000
      node_port   = 30080
    }

    type = "NodePort"
  }
}

resource "kubernetes_service" "mysqlsvc" {
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
      node_port   = 30033
    }

    type = "NodePort"
  }
}
