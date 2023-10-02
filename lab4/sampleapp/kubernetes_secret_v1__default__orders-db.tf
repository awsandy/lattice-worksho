# kubernetes_secret_v1.default__orders-db:
resource "kubernetes_secret_v1" "default__orders-db" {
  data = {
    username = "b3JkZXJz"
    password = "Wk5QSHgwQ1lSWTBnUWg2WQ=="
  }
  immutable = false
  type      = "Opaque"

  metadata {
    annotations = {}
    labels      = {}
    name        = "orders-db"
    namespace   = "default"
  }

  timeouts {}
}
