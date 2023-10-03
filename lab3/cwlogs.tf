#/latticeworkshop/parking-svc-logs
resource "aws_cloudwatch_log_group" "superappsvcnetwork" {
  name = "/lattice/sn/superappsvcnetwork"
  retention_in_days=7

  tags = {
    Environment = "Workshop"
    Application = "VPC Lattice Workshop"
  }
}

resource "aws_cloudwatch_log_group" "parking" {
  name = "/lattice/svc/parking"
  retention_in_days=7

  tags = {
    Environment = "Workshop"
    Application = "VPC Lattice Workshop"
  }
}

resource "aws_cloudwatch_log_group" "parking-flow" {
  name = "/lattice/flowlogs/parking"
  retention_in_days=7

  tags = {
    Environment = "Workshop"
    Application = "VPC Lattice Workshop"
  }
}

resource "aws_cloudwatch_log_group" "rates-flow" {
  name = "/lattice/flowlogs/rates"
  retention_in_days=7

  tags = {
    Environment = "Workshop"
    Application = "VPC Lattice Workshop"
  }
}

resource "aws_cloudwatch_log_group" "reservation-flow" {
  name = "/lattice/flowlogs/reservation"
  retention_in_days=7

  tags = {
    Environment = "Workshop"
    Application = "VPC Lattice Workshop"
  }
}