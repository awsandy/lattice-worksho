# kubernetes_service_v1.default__checkout-redis:
resource "kubernetes_service_v1" "default__checkout-redis" {
  metadata {
    annotations = {}
    labels = {
      "app.kubernetes.io/component"  = "redis"
      "app.kubernetes.io/instance"   = "checkout"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "checkout"
      "helm.sh/chart"                = "checkout-0.0.1"
    }
    name      = "checkout-redis"
    namespace = "default"
  }

  spec {
    allocate_load_balancer_node_ports = true
    cluster_ip                        = "172.20.169.70"
    cluster_ips = [
      "172.20.169.70",
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
      "app.kubernetes.io/component" = "redis"
      "app.kubernetes.io/instance"  = "checkout"
      "app.kubernetes.io/name"      = "checkout"
    }
    session_affinity = "None"
    type             = "ClusterIP"

    port {
      name        = "redis"
      node_port   = 0
      port        = 6379
      protocol    = "TCP"
      target_port = "redis"
    }
  }

  wait_for_load_balancer = true
  timeouts {}
}
