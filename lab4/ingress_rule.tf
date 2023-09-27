
resource "aws_security_group_rule" "lattice-ingress" {
depends_on = [ module.eks, module.vpc]
  description  = "VPC lattice"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = data.aws_ec2_managed_prefix_list.vpc-lattice.entries[*].cidr
  security_group_id = module.eks.cluster_primary_security_group_id
}

