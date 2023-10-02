# kubernetes_service_account_v1.default__ui:
resource "kubernetes_service_account_v1" "default__ui" {
  automount_service_account_token = false

  metadata {
    annotations = {}
    labels = {
      "app.kuberneres.io/owner"      = "retail-store-sample"
      "app.kubernetes.io/component"  = "service"
      "app.kubernetes.io/instance"   = "ui"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "ui"
      "helm.sh/chart"                = "ui-0.0.1"
    }
    name      = "ui"
    namespace = "default"
  }

  timeouts {}
}
