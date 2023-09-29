resource "aws_ssm_parameter" "cluster1_vpcid" {
  name        = "/vpclattice/workshop/cluster1_vpcid"
  description = "The vpc id for cluster 1"
  type        = "String"
  value       = module.vpc.vpc_id

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}