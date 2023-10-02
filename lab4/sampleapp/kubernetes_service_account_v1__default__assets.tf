# kubernetes_service_account_v1.default__assets:
resource "kubernetes_service_account_v1" "default__assets" {
  automount_service_account_token = false

  metadata {
    annotations = {}
    labels = {
      "app.kuberneres.io/owner"      = "retail-store-sample"
      "app.kubernetes.io/component"  = "service"
      "app.kubernetes.io/instance"   = "assets"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "assets"
      "helm.sh/chart"                = "assets-0.0.1"
    }
    name      = "assets"
    namespace = "default"
  }

  timeouts {}
}
