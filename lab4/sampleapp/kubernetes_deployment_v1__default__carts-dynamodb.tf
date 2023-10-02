# kubernetes_deployment_v1.default__carts-dynamodb:
resource "kubernetes_deployment_v1" "default__carts-dynamodb" {

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
    min_ready_seconds         = 0
    paused                    = false
    progress_deadline_seconds = 600
    replicas                  = "1"
    revision_history_limit    = 10

    selector {
      match_labels = {
        "app.kubernetes.io/component" = "dynamodb"
        "app.kubernetes.io/instance"  = "carts"
        "app.kubernetes.io/name"      = "carts"
      }
    }

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }

    template {
      metadata {
        annotations = {}
        labels = {
          "app.kubernetes.io/component" = "dynamodb"
          "app.kubernetes.io/instance"  = "carts"
          "app.kubernetes.io/name"      = "carts"
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
          image                      = "amazon/dynamodb-local:1.13.1"
          image_pull_policy          = "IfNotPresent"
          name                       = "dynamodb"
          stdin                      = false
          stdin_once                 = false
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          tty                        = false

          port {
            container_port = 8000
            name           = "dynamodb"
            protocol       = "TCP"
          }

          resources {
            limits   = {}
            requests = {}
          }
        }
      }
    }
  }

  timeouts {}
}
