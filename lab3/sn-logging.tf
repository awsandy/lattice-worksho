resource "aws_vpclattice_access_log_subscription" "example" {
  resource_identifier = data.aws_vpclattice_service_network.example.id
  destination_arn     = aws_cloudwatch_log_group.yada.arn
}



