# kubernetes_stateful_set_v1.default__catalog-mysql:
resource "kubernetes_stateful_set_v1" "default__catalog-mysql" {

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
    pod_management_policy  = "OrderedReady"
    replicas               = "1"
    revision_history_limit = 10
    service_name           = "catalog-mysql"

    selector {
      match_labels = {
        "app.kubernetes.io/component" = "mysql"
        "app.kubernetes.io/instance"  = "catalog"
        "app.kubernetes.io/name"      = "catalog"
      }
    }

    template {
      metadata {
        annotations = {}
        labels = {
          "app.kubernetes.io/component" = "mysql"
          "app.kubernetes.io/instance"  = "catalog"
          "app.kubernetes.io/name"      = "catalog"
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
          args = [
            "--ignore-db-dir=lost+found",
          ]
          command                    = []
          image                      = "public.ecr.aws/docker/library/mysql:5.7"
          image_pull_policy          = "IfNotPresent"
          name                       = "mysql"
          stdin                      = false
          stdin_once                 = false
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          tty                        = false

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "my-secret-pw"
          }
          env {
            name  = "MYSQL_DATABASE"
            value = "catalog"
          }
          env {
            name = "MYSQL_USER"

            value_from {
              secret_key_ref {
                key      = "username"
                name     = "catalog-db"
                optional = false
              }
            }
          }
          env {
            name = "MYSQL_PASSWORD"

            value_from {
              secret_key_ref {
                key      = "password"
                name     = "catalog-db"
                optional = false
              }
            }
          }

          port {
            container_port = 3306
            name           = "mysql"
            protocol       = "TCP"
          }

          resources {
            limits   = {}
            requests = {}
          }

          volume_mount {
            mount_path        = "/var/lib/mysql"
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
