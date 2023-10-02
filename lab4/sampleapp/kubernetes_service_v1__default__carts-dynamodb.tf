# kubernetes_service_v1.default__carts-dynamodb:
resource "kubernetes_service_v1" "default__carts-dynamodb" {
  metadata {
    annotations = {}
    labels = {
      "app.kubernetes.io/component"  = "dynamodb"
      "app.kubernetes.io/instance"   = "carts"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "carts"
      "helm.sh/chart"                = "carts-0.0.1"
    }
    name      = "carts-dynamodb"
    namespace = "default"
  }

  spec {
    allocate_load_balancer_node_ports = true
    cluster_ip                        = "172.20.253.53"
    cluster_ips = [
      "172.20.253.53",
    ]
    external_ips            = []
    internal_traffic_policy = "Cluster"
    ip_families = [
      "IPv4",
    ]
    ip_family_policy            = "SingleStack"
    load_balancer_source_ranges = []
    publish_not_ready_addresses = false
    selector = {
      "app.kubernetes.io/component" = "dynamodb"
      "app.kubernetes.io/instance"  = "carts"
      "app.kubernetes.io/name"      = "carts"
    }
    session_affinity = "None"
    type             = "ClusterIP"

    port {
      name        = "dynamodb"
      node_port   = 0
      port        = 8000
      protocol    = "TCP"
      target_port = "dynamodb"
    }
  }

  wait_for_load_balancer = true
  timeouts {}
}
