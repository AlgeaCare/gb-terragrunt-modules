# ED25519 key for ArgoCD
resource "tls_private_key" "this" {
  algorithm = "ED25519"
}

resource "helm_release" "argocd" {
  name = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_helm_chart_version
  namespace        = var.argocd_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/templates/${var.argocd_values_file}", {
      k8s_ssh_private_key = tls_private_key.this.private_key_openssh
      k8s_iac_url             = var.gitlab_private_repo_urls.k8s_iac
    })
  ]

  lifecycle {
    prevent_destroy = false
  }
}


resource "kubectl_manifest" "initial_bootstrap" {
  yaml_body = templatefile("${path.module}/templates/argocd-initial-bootstrap.yaml", {
    namespace      = var.initial_bootstrap.namespace,
    path           = var.initial_bootstrap.path,
    repoURL        = var.initial_bootstrap.repoURL,
    targetRevision = var.initial_bootstrap.targetRevision
  })

  depends_on = [
    helm_release.argocd,
    tls_private_key.this,
  ]
}
