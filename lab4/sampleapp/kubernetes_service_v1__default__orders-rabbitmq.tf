# kubernetes_service_v1.default__orders-rabbitmq:
resource "kubernetes_service_v1" "default__orders-rabbitmq" {
  metadata {
    annotations = {}
    labels = {
      "app.kubernetes.io/component"  = "rabbitmq"
      "app.kubernetes.io/instance"   = "orders"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "orders"
      "helm.sh/chart"                = "orders-0.0.1"
    }
    name      = "orders-rabbitmq"
    namespace = "default"
  }

  spec {
    allocate_load_balancer_node_ports = true
    cluster_ip                        = "172.20.118.180"
    cluster_ips = [
      "172.20.118.180",
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
      "app.kubernetes.io/component" = "rabbitmq"
      "app.kubernetes.io/instance"  = "orders"
      "app.kubernetes.io/name"      = "orders"
    }
    session_affinity = "None"
    type             = "ClusterIP"

    port {
      name        = "amqp"
      node_port   = 0
      port        = 5672
      protocol    = "TCP"
      target_port = "amqp"
    }
    port {
      name        = "http"
      node_port   = 0
      port        = 15672
      protocol    = "TCP"
      target_port = "http"
    }
  }

  wait_for_load_balancer = true
  timeouts {}
}
