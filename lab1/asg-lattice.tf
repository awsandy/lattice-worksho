resource "aws_autoscaling_traffic_source_attachment" "example" {
  autoscaling_group_name = data.aws_autoscaling_group.rates.id

  traffic_source {
    identifier = aws_vpclattice_target_group.rates-tg.arn
    type       = "vpc-lattice"
  }
}