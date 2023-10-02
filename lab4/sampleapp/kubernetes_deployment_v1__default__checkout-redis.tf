# kubernetes_deployment_v1.default__checkout-redis:
resource "kubernetes_deployment_v1" "default__checkout-redis" {

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
    min_ready_seconds         = 0
    paused                    = false
    progress_deadline_seconds = 600
    replicas                  = "1"
    revision_history_limit    = 10

    selector {
      match_labels = {
        "app.kubernetes.io/component" = "redis"
        "app.kubernetes.io/instance"  = "checkout"
        "app.kubernetes.io/name"      = "checkout"
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
          "app.kubernetes.io/component" = "redis"
          "app.kubernetes.io/instance"  = "checkout"
          "app.kubernetes.io/name"      = "checkout"
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
          image                      = "redis:6.0-alpine"
          image_pull_policy          = "IfNotPresent"
          name                       = "redis"
          stdin                      = false
          stdin_once                 = false
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          tty                        = false

          port {
            container_port = 6379
            name           = "redis"
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
