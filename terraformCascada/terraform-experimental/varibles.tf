variable "kubernetes_host" {
  type        = string
  description = <<EOT
    The host url where the controls node exists. This can be getted using "kubectl config view"
  EOT
}

variable "env_vars" {
  type = map(any)
}

