# payments
data "aws_vpc" "payments" {
  filter {
    name = "tag:Name"
    values= ["LatticeWorkshop Payments VPC"]
  }
}
data "aws_vpc" "rates" {
  filter {
    name = "tag:Name"
    values= ["LatticeWorkshop Rates VPC"]
  }
}


data "aws_vpc" "reservations" {
  filter {
    name = "tag:Name"
    values= ["LatticeWorkshop Reservations VPC"]
  }
}

# vpc-0552cbf8549150e66
data "aws_vpc" "clients" {
  filter {
    name = "tag:Name"
    values= ["LatticeWorkshop Clients VPC"]
  }
}
# sg-03d872da0ef11f465  clients-sg
data "aws_security_group" "clients-sg" {
  name="clients-sg"
  vpc_id     = data.aws_vpc.clients.id
}


data "aws_lambda_function" "reservation" {
  function_name = "LatticeReservationLambda"
}

