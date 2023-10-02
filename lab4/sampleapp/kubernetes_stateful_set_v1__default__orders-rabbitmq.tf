# kubernetes_stateful_set_v1.default__orders-rabbitmq:
resource "kubernetes_stateful_set_v1" "default__orders-rabbitmq" {

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
    pod_management_policy  = "OrderedReady"
    replicas               = "1"
    revision_history_limit = 10
    service_name           = "orders-rabbitmq"

    selector {
      match_labels = {
        "app.kubernetes.io/component" = "rabbitmq"
        "app.kubernetes.io/instance"  = "orders"
        "app.kubernetes.io/name"      = "orders"
      }
    }

    template {
      metadata {
        annotations = {}
        labels = {
          "app.kubernetes.io/component" = "rabbitmq"
          "app.kubernetes.io/instance"  = "orders"
          "app.kubernetes.io/name"      = "orders"
        }
      }
      spec {
        automount_service_account_token  = false
        dns_policy                       = "ClusterFirst"
        enable_service_links             = false
        host_ipc                         = false
        host_network                     = false
        host_pid                         = false
        node_selector                    = {}
        restart_policy                   = "Always"
        scheduler_name                   = "default-scheduler"
        share_process_namespace          = false
        termination_grace_period_seconds = 30

        container {
          args                       = []
          command                    = []
          image                      = "rabbitmq:3-management"
          image_pull_policy          = "IfNotPresent"
          name                       = "rabbitmq"
          stdin                      = false
          stdin_once                 = false
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          tty                        = false

          port {
            container_port = 5672
            name           = "amqp"
            protocol       = "TCP"
          }
          port {
            container_port = 15672
            name           = "http"
            protocol       = "TCP"
          }

          resources {
            limits   = {}
            requests = {}
          }

          volume_mount {
            mount_path        = "/var/lib/rabbitmq/mnesia"
            mount_propagation = "None"
            name              = "data"
            read_only         = false
          }
        }

        volume {
          name = "data"

          empty_dir {}
        }
      }
    }
  }

  timeouts {}
}
