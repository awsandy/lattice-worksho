# kubernetes_secret_v1.default__orders-rabbitmq:
resource "kubernetes_secret_v1" "default__orders-rabbitmq" {
  immutable = false
  type      = "Opaque"

  metadata {
    annotations = {}
    labels      = {}
    name        = "orders-rabbitmq"
    namespace   = "default"
  }

  timeouts {}
}
