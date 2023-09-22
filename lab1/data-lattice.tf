# payments
data "aws_vpc" "payments" {
  id = data.aws_ssm_parameter.vpc-payments.value

}
data "aws_vpc" "rates" {
  id = data.aws_ssm_parameter.vpc-rates.value
}


data "aws_vpc" "reservations" {
  id = data.aws_ssm_parameter.vpc-reservations.value

}

# vpc-0552cbf8549150e66
data "aws_vpc" "clients" {
  id = data.aws_ssm_parameter.vpc-clients.value
}

# sg-03d872da0ef11f465  clients-sg
data "aws_security_group" "clients-sg" {
  name    = "clients-sg"
  vpc_id  = data.aws_vpc.clients.id
}

data "aws_lambda_function" "reservation" {
  function_name = "LatticeReservationLambda"
}

data "aws_ssm_parameter" "alb" {
  name        = "/vpclattice/workshop/alb"
}

data "aws_ssm_parameter" "asg-rates" {
  name        = "/vpclattice/workshop/asg-rates"
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