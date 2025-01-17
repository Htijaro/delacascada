terraform {
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
  config_path = local.kubernetes_config_path
  host        = var.kubernetes_host
  insecure    = local.kubernetes_insecure
}