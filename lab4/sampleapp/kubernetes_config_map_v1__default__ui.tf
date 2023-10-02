# kubernetes_config_map_v1.default__ui:
resource "kubernetes_config_map_v1" "default__ui" {
  binary_data = {}
  data = {
    "ENDPOINTS_ASSETS"   = "http://assets-c1-lattice.lattice.io"
    "ENDPOINTS_CARTS"    = "http://carts-c1-lattice.lattice.io"
    "ENDPOINTS_CATALOG"  = "http://catalog-c1-lattice.lattice.io"
    "ENDPOINTS_CHECKOUT" = "http://checkout-c1-lattice.lattice.io"
    "ENDPOINTS_ORDERS"   = "http://orders-c1-lattice.lattice.io"
  }
  immutable = false

  metadata {
    annotations = {}
    labels      = {}
    name        = "ui"
    namespace   = "default"
  }
}
