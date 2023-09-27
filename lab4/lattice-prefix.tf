data "aws_region" "current" {}

data "aws_ec2_managed_prefix_list" "vpc-lattice" {
  name = "com.amazonaws.${data.aws_region.current.name}.vpc-lattice"
}