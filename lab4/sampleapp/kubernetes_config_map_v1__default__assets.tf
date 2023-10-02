# kubernetes_config_map_v1.default__assets:
resource "kubernetes_config_map_v1" "default__assets" {
  binary_data = {}
  data = {
    "PORT" = "8080"
  }
  immutable = false

  metadata {
    annotations = {}
    labels      = {}
    name        = "assets"
    namespace   = "default"
  }
}
