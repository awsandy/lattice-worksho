# kubernetes_service_account_v1.default__carts:
resource "kubernetes_service_account_v1" "default__carts" {
  automount_service_account_token = false

  metadata {
    annotations = {}
    labels = {
      "app.kuberneres.io/owner"      = "retail-store-sample"
      "app.kubernetes.io/component"  = "service"
      "app.kubernetes.io/instance"   = "carts"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "carts"
      "helm.sh/chart"                = "carts-0.0.1"
    }
    name      = "carts"
    namespace = "default"
  }

  timeouts {}
}
