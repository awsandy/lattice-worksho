data "aws_ssm_parameter" "sn" {
  name        = "/vpclattice/workshop/id"
}

data "aws_ssm_parameter" "svc-parking" {
  name        = "/vpclattice/workshop/svc-parking-arn"

}

data "aws_ssm_parameter" "svc-reservation" {
  name        = "/vpclattice/workshop/svc-reservation-arn"

}