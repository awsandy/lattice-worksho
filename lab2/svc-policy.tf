resource "aws_vpclattice_auth_policy" "example" {
  resource_identifier = data.aws_ssm_parameter.svc-parking.value
  policy = data.aws_iam_policy_document.example.json
}

#### policy data
data "aws_iam_policy_document" "example" {
  statement {
    actions = ["vpc-lattice-svcs:Invoke"]
    resources = [
        format("%s/rates",data.aws_ssm_parameter.svc-parking.value)
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
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
      identifiers = ["*"]
    }

    condition {
            test = "StringEquals"
            variable = "vpc-lattice-svcs:RequestMethod"
            values = ["GET"]
    }
  }


}

   


