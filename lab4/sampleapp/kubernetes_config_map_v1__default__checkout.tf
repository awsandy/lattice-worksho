# kubernetes_config_map_v1.default__checkout:
resource "kubernetes_config_map_v1" "default__checkout" {
  binary_data = {}
  data = {
    "ENDPOINTS_ORDERS" = "http://orders-c1-lattice.lattice.io:80"
    "REDIS_URL"        = "redis://checkout-redis:6379"
  }
  immutable = false

  metadata {
    annotations = {}
    labels      = {}
    name        = "checkout"
    namespace   = "default"
  }
}
