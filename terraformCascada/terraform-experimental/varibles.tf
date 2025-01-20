variable "kubernetes_host" {
  type        = string
  description = "The Kubernetes API server URL"
}

variable "env_vars" {
  type = map(string)
}