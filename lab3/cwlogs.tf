#/latticeworkshop/parking-svc-logs
resource "aws_cloudwatch_log_group" "yada" {
  name = "/lattice/sn/superappsvcnetwork"
  retention_in_days=7

  tags = {
    Environment = "Workshop"
    Application = "VPC Lattice Workshop"
  }
}