# kubernetes_config_map_v1.default__catalog:
resource "kubernetes_config_map_v1" "default__catalog" {
  binary_data = {}
  data = {
    "DB_ENDPOINT"      = "catalog-mysql:3306"
    "DB_NAME"          = "catalog"
    "DB_READ_ENDPOINT" = "catalog-mysql:3306"
  }
  immutable = false

  metadata {
    annotations = {}
    labels      = {}
    name        = "catalog"
    namespace   = "default"
  }
}
