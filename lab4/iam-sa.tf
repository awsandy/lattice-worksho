resource "aws_iam_role" "lattice-inline-policy" {
  name                  = "lattice-inline-policy"
  force_detach_policies = true
  max_session_duration  = 3600
  path                  = "/"
  assume_role_policy    = jsonencode(
    {
      "Version": "2012-10-17"
      "Statement": [
        {
          "Effect": "Allow"
          "Principal": {
              "Federated": format("%s",data.aws_iam_openid_connect_provider.example.arn)
          }
          "Action": "sts:AssumeRoleWithWebIdentity"
        }
      ]
    }
 )
}

resource "aws_iam_policy" "lattice-inline-policy" {
  name        = "lattice-inline-policy"
  path        = "/"
  description = "Lattice recommended inline policy"
  policy = file("./recommended-inline-policy.json")
}


######## Policy attachment to IAM role ########

resource "aws_iam_role_policy_attachment" "policy-attach1" {
  role       = aws_iam_role.lattice-inline-policy.name
  policy_arn = aws_iam_policy.lattice-inline-policy.arn
}
















    