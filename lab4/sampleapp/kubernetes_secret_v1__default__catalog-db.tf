# kubernetes_secret_v1.default__catalog-db:
resource "kubernetes_secret_v1" "default__catalog-db" {
  data = {
    username = "Y2F0YWxvZw=="
    password = "amJrcHh0Y3pkZHhqU21EaA=="
  }
  immutable = false
  type      = "Opaque"

  metadata {
    annotations = {}
    labels      = {}
    name        = "catalog-db"
    namespace   = "default"
  }

  timeouts {}
}
