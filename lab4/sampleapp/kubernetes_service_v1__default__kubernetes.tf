# kubernetes_service_v1.default__kubernetes:
resource "kubernetes_service_v1" "default__kubernetes" {
  metadata {
    annotations = {}
    labels = {
      "component" = "apiserver"
      "provider"  = "kubernetes"
    }
    name      = "kubernetes"
    namespace = "default"
  }

  spec {
    allocate_load_balancer_node_ports = true
    cluster_ip                        = "172.20.0.1"
    cluster_ips = [
      "172.20.0.1",
    ]
    external_ips            = []
    internal_traffic_policy = "Cluster"
    ip_families = [
      "IPv4",
    ]
    ip_family_policy            = "SingleStack"
    load_balancer_source_ranges = []
    publish_not_ready_addresses = false
    selector                    = {}
    session_affinity            = "None"
    type                        = "ClusterIP"

    port {
      name        = "https"
      node_port   = 0
      port        = 443
      protocol    = "TCP"
      target_port = "443"
    }
  }

  wait_for_load_balancer = true
  timeouts {}
}
