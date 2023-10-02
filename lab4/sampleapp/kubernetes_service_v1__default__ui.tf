# kubernetes_service_v1.default__ui:
resource "kubernetes_service_v1" "default__ui" {
  metadata {
    annotations = {}
    labels = {
      "app.kuberneres.io/owner"      = "retail-store-sample"
      "app.kubernetes.io/component"  = "service"
      "app.kubernetes.io/instance"   = "ui"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "ui"
      "helm.sh/chart"                = "ui-0.0.1"
    }
    name      = "ui"
    namespace = "default"
  }

  spec {
    allocate_load_balancer_node_ports = true
    cluster_ip                        = "172.20.113.195"
    cluster_ips = [
      "172.20.113.195",
    ]
    external_ips            = []
    external_traffic_policy = "Cluster"
    internal_traffic_policy = "Cluster"
    ip_families = [
      "IPv4",
    ]
    ip_family_policy            = "SingleStack"
    load_balancer_source_ranges = []
    publish_not_ready_addresses = false
    selector = {
      "app.kuberneres.io/owner"     = "retail-store-sample"
      "app.kubernetes.io/component" = "service"
      "app.kubernetes.io/instance"  = "ui"
      "app.kubernetes.io/name"      = "ui"
    }
    session_affinity = "None"
    type             = "LoadBalancer"

    port {
      name        = "http"
      node_port   = 32116
      port        = 80
      protocol    = "TCP"
      target_port = "http"
    }
  }

  wait_for_load_balancer = true
  timeouts {}
}
