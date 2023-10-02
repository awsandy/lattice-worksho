# kubernetes_deployment_v1.default__orders:
resource "kubernetes_deployment_v1" "default__orders" {

  metadata {
    annotations = {}
    labels = {
      "app.kuberneres.io/owner"      = "retail-store-sample"
      "app.kubernetes.io/component"  = "service"
      "app.kubernetes.io/instance"   = "orders"
      "app.kubernetes.io/managed-by" = "Helm"
      "app.kubernetes.io/name"       = "orders"
      "helm.sh/chart"                = "orders-0.0.1"
    }
    name      = "orders"
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
        "app.kuberneres.io/owner"     = "retail-store-sample"
        "app.kubernetes.io/component" = "service"
        "app.kubernetes.io/instance"  = "orders"
        "app.kubernetes.io/name"      = "orders"
      }
    }

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = "25%"
        max_unavailable = "1"
      }
    }

    template {
      metadata {
        annotations = {}
        labels = {
          "app.kuberneres.io/owner"     = "retail-store-sample"
          "app.kubernetes.io/component" = "service"
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
        service_account_name             = "orders"
        share_process_namespace          = false
        termination_grace_period_seconds = 30

        container {
          args                       = []
          command                    = []
          image                      = "public.ecr.aws/aws-containers/retail-store-sample-orders:0.5.0"
          image_pull_policy          = "IfNotPresent"
          name                       = "orders"
          stdin                      = false
          stdin_once                 = false
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          tty                        = false

          env {
            name  = "JAVA_OPTS"
            value = "-XX:MaxRAMPercentage=75.0 -Djava.security.egd=file:/dev/urandom"
          }
          env {
            name = "SPRING_DATASOURCE_WRITER_USERNAME"

            value_from {
              secret_key_ref {
                key      = "username"
                name     = "orders-db"
                optional = false
              }
            }
          }
          env {
            name = "SPRING_DATASOURCE_WRITER_PASSWORD"

            value_from {
              secret_key_ref {
                key      = "password"
                name     = "orders-db"
                optional = false
              }
            }
          }
          env {
            name = "SPRING_DATASOURCE_READER_USERNAME"

            value_from {
              secret_key_ref {
                key      = "username"
                name     = "orders-db"
                optional = false
              }
            }
          }
          env {
            name = "SPRING_DATASOURCE_READER_PASSWORD"

            value_from {
              secret_key_ref {
                key      = "password"
                name     = "orders-db"
                optional = false
              }
            }
          }

          env_from {
            secret_ref {
              name     = "orders-rabbitmq"
              optional = false
            }
          }
          env_from {
            config_map_ref {
              name     = "orders"
              optional = false
            }
          }

          liveness_probe {
            failure_threshold     = 3
            initial_delay_seconds = 45
            period_seconds        = 3
            success_threshold     = 1
            timeout_seconds       = 1

            http_get {
              path   = "/actuator/health/liveness"
              port   = "8080"
              scheme = "HTTP"
            }
          }

          port {
            container_port = 8080
            name           = "http"
            protocol       = "TCP"
          }

          resources {
            limits = {
              "memory" = "512Mi"
            }
            requests = {
              "cpu"    = "128m"
              "memory" = "512Mi"
            }
          }

          security_context {
            allow_privilege_escalation = false
            privileged                 = false
            read_only_root_filesystem  = true
            run_as_non_root            = true
            run_as_user                = "1000"

            capabilities {
              add = []
              drop = [
                "ALL",
              ]
            }
          }

          volume_mount {
            mount_path        = "/tmp"
            mount_propagation = "None"
            name              = "tmp-volume"
            read_only         = false
          }
        }

        security_context {
          fs_group            = "1000"
          run_as_non_root     = false
          supplemental_groups = []
        }

        volume {
          name = "tmp-volume"

          empty_dir {
            medium = "Memory"
          }
        }
      }
    }
  }

  timeouts {}
}
