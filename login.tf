provider "kubernetes" {
  config_context_auth_info = "k8s-admin@kubernetes"
}

resource "kubernetes_namespace" "devops" {
  metadata {
    name = "devopss"
  }
}

output "kubeconfig" {
  value = data.kubernetes_secret.admin.data["kubeconfig"]
}

data "kubernetes_secret" "admin" {
  metadata {
    name      = "k8s-admin"
    namespace = "kube-system"
  }
}