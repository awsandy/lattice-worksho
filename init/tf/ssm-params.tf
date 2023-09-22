resource "aws_ssm_parameter" "alb" {
  name        = "/vpclattice/workshop/alb"
  description = "The name of the alb"
  type        = "String"
  value       = aws_lb.arn_aws_elasticloadbalancing_eu-west-1_566972129213_loadbalancer_app_testl-Payme-UNPBI1NL9VPA_5ee6b15c48e1c3fa.name

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

resource "aws_ssm_parameter" "asg-rates" {
  name        = "/vpclattice/workshop/asg-rates"
  description = "The name of the rates asg"
  type        = "String"
  value       = aws_autoscaling_group.testlatticebaseinfrawithapiserver-RatesASG-16HVW360AFWPF.name

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

resource "aws_ssm_parameter" "vpc-rates" {
  name        = "/vpclattice/workshop/vpc-rates"
  description = "The id of the vpc rates"
  type        = "String"
  value       = aws_vpc.rates.id

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

resource "aws_ssm_parameter" "vpc-clients" {
  name        = "/vpclattice/workshop/vpc-clients"
  description = "The id of the vpc rates"
  type        = "String"
  value       = aws_vpc.vpc-0552cbf8549150e66.id

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

resource "aws_ssm_parameter" "vpc-reservations" {
  name        = "/vpclattice/workshop/vpc-reservations"
  description = "The id of the vpc rates"
  type        = "String"
  value       = aws_vpc.vpc-06977ec8dcb8f6e81.id

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

resource "aws_ssm_parameter" "vpc-payments" {
  name        = "/vpclattice/workshop/vpc-payments"
  description = "The id of the vpc payments"
  type        = "String"
  value       = aws_vpc.payments.id

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

# client instance arns

resource "aws_ssm_parameter" "client1-instance-arn" {
  name        = "/vpclattice/workshop/client1-instance-arn"
  description = "The arn of the client1 instance"
  type        = "String"
  value       = aws_instance.i-0c8863041f376c78e.arn

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

resource "aws_ssm_parameter" "client2-instance-arn" {
  name        = "/vpclattice/workshop/client2-instance-arn"
  description = "The arn of the client2 instance"
  type        = "String"
  value       = aws_instance.i-0d2177a70c5cd8982.arn

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}