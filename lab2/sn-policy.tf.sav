resource "aws_vpclattice_auth_policy" "sn" {
  resource_identifier = data.aws_vpclattice_service_network.svn.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "*"
        Effect    = "Allow"
        Principal = "*"
        Resource  = "*"
        Condition = {
          StringNotEqualsIgnoreCase = {
            "aws:PrincipalType" = "anonymous"
          }
        }
      }
    ]
  })
}