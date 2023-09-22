resource "aws_ssm_parameter" "sn" {
  name        = "/vpclattice/workshop/id"
  description = "The unique id for the sn"
  type        = "String"
  value       = aws_vpclattice_service_network.sn-09c95c9b9ab29e33e.id

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}


resource "aws_ssm_parameter" "svc-parking" {
  name        = "/vpclattice/workshop/svc-parking-arn"
  description = "The arn of the parking service"
  type        = "String"
  value       = aws_vpclattice_service.svc-06f9423290d1e2bb1.arn

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}

resource "aws_ssm_parameter" "svc-reservation" {
  name        = "/vpclattice/workshop/svc-reservation-arn"
  description = "The arn of the reservation service"
  type        = "String"
  value       =  aws_vpclattice_service.svc-01140bc6b2d1ae15b.arn

  tags = {
    workshop = "VPC Lattice Workshop"
  }
}



