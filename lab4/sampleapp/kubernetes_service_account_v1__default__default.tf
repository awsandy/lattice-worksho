# kubernetes_service_account_v1.default__default:
resource "kubernetes_service_account_v1" "default__default" {
  automount_service_account_token = false

  metadata {
    annotations = {}
    labels      = {}
    name        = "default"
    namespace   = "default"
  }

  timeouts {}
}
