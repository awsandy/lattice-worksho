# kubernetes_service_v1.default__catalog-mysql:
resource "kubernetes_service_v1" "default__catalog-mysql" {
  metadata {
    annotations = {}
    labels = {
      "app.kubernetes.io/component"  = "mysql"
      "app.kubernetes.io/instance"   = "catalog"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "catalog"
      "helm.sh/chart"                = "catalog-0.0.1"
    }
    name      = "catalog-mysql"
    namespace = "default"
  }

  spec {
    allocate_load_balancer_node_ports = true
    cluster_ip                        = "172.20.82.213"
    cluster_ips = [
      "172.20.82.213",
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
      "app.kubernetes.io/component" = "mysql"
      "app.kubernetes.io/instance"  = "catalog"
      "app.kubernetes.io/name"      = "catalog"
    }
    session_affinity = "None"
    type             = "ClusterIP"

    port {
      name        = "mysql"
      node_port   = 0
      port        = 3306
      protocol    = "TCP"
      target_port = "mysql"
    }
  }

  wait_for_load_balancer = true
  timeouts {}
}
