resource "aws_vpclattice_auth_policy" "example" {
  resource_identifier = data.aws_ssm_parameter.svc-parking.arn
  policy = data.aws_iam_policy_document.example.json
}

#### policy data
data "aws_iam_policy_document" "example" {
  statement {
    sid = "1"
    actions = ["vpc-lattice-svcs:Invoke"]
    resources = [
        format("%s/rates",data.aws_ssm_parameter.svc-parking.value)
    ]
    principals {
      type        = "AWS"
      identifiers = [data.aws_ssm_parameter.client1-instance-arn.value]
    }
  }

  statement {
    sid = "2"
    actions = ["vpc-lattice-svcs:Invoke"]
    resources = [
        format("%s/payments",data.aws_ssm_parameter.svc-parking.value)
    ]
    principals {
      type        = "AWS"
      identifiers = [data.aws_ssm_parameter.client2-instance-arn.value]
    }

    condition {
            test = "StringEquals"
            variable = "vpc-lattice-svcs:RequestMethod"
            values = ["GET"]
    }
  }

}

   


