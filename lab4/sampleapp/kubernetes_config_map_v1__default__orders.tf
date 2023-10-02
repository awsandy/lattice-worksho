# kubernetes_config_map_v1.default__orders:
resource "kubernetes_config_map_v1" "default__orders" {
  binary_data = {}
  data = {
    "SPRING_DATASOURCE_READER_URL" = "jdbc:mariadb://orders-mysql:3306/orders"
    "SPRING_DATASOURCE_WRITER_URL" = "jdbc:mariadb://orders-mysql:3306/orders"
    "SPRING_PROFILES_ACTIVE"       = "mysql,rabbitmq"
    "SPRING_RABBITMQ_ADDRESSES"    = "amqp://orders-rabbitmq:5672"
  }
  immutable = false

  metadata {
    annotations = {}
    labels      = {}
    name        = "orders"
    namespace   = "default"
  }
}
