# kubernetes_service_account_v1.default__checkout:
resource "kubernetes_service_account_v1" "default__checkout" {
  automount_service_account_token = false

  metadata {
    annotations = {}
    labels = {
      "app.kuberneres.io/owner"      = "retail-store-sample"
      "app.kubernetes.io/component"  = "service"
      "app.kubernetes.io/instance"   = "checkout"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "checkout"
      "helm.sh/chart"                = "checkout-0.0.1"
    }
    name      = "checkout"
    namespace = "default"
  }

  timeouts {}
}
