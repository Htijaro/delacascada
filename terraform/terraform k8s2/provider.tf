terraform {
  required_version = "~> 1.10"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.10"
    }
  }
  backend "local" {
    path = "/tmp/terraform.tfstate"
  }
}

provider "kubernetes" {
  host = "https://192.168.100.80:16443"
}
