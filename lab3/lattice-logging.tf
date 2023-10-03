resource "aws_vpclattice_access_log_subscription" "superappsvcnetwork" {
  resource_identifier = data.aws_vpclattice_service_network.svn.id
  destination_arn     = aws_cloudwatch_log_group.superappsvcnetwork.arn
}


resource "aws_vpclattice_access_log_subscription" "parking" {
  resource_identifier = data.aws_ssm_parameter.svc-parking.value
  destination_arn     = aws_cloudwatch_log_group.parking.arn
}



