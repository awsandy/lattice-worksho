# kubernetes_service_account_v1.default__catalog:
resource "kubernetes_service_account_v1" "default__catalog" {
  automount_service_account_token = false

  metadata {
    annotations = {}
    labels = {
      "app.kuberneres.io/owner"      = "retail-store-sample"
      "app.kubernetes.io/component"  = "service"
      "app.kubernetes.io/instance"   = "catalog"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "catalog"
      "helm.sh/chart"                = "catalog-0.0.1"
    }
    name      = "catalog"
    namespace = "default"
  }

  timeouts {}
}
