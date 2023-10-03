data "aws_ssm_parameter" "sn" {
  name        = "/vpclattice/workshop/id"
}

data "aws_ssm_parameter" "svc-parking" {
  name        = "/vpclattice/workshop/svc-parking-arn"
}

data "aws_ssm_parameter" "vpc-rates" {
  name        = "/vpclattice/workshop/vpc-rates"
}

data "aws_ssm_parameter" "vpc-clients" {
  name        = "/vpclattice/workshop/vpc-clients"
}

data "aws_ssm_parameter" "vpc-reservations" {
  name        = "/vpclattice/workshop/vpc-reservations"
}

data "aws_ssm_parameter" "vpc-payments" {
  name        = "/vpclattice/workshop/vpc-payments"
}