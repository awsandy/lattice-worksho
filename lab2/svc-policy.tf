resource "aws_vpclattice_auth_policy" "example" {
  resource_identifier = data.aws_ssm_parameter.svc-parking.arn
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                            "AWS": "<‘LatticeWorkshop InstanceClient1’ IAM ARN>"
            },
            "Action": "vpc-lattice-svcs:Invoke",
                     "Resource": "<ARN of Parking Service>/rates"
        },
        {
            "Effect": "Allow",
            "Principal": {
                    "AWS": "<‘LatticeWorkshop InstanceClient2’ IAM ARN>"
            },
            "Action": "vpc-lattice-svcs:Invoke",
                    "Resource": "<ARN of Parking Service>/payments",
            "Condition": {
                "StringEquals": {
                    "vpc-lattice-svcs:RequestMethod": "GET"
                }
            }
        }
    ]
})
}


#### policy data









{
            "Version": "2012-10-17",
                "Statement": [
                    {
                        "Effect": "Allow",
                        "Principal": {
                            "AWS": "<‘LatticeWorkshop InstanceClient1’ IAM ARN>"
                        },
                        "Action": "vpc-lattice-svcs:Invoke",
                        "Resource": "<ARN of Parking Service>/rates"
                    },
                    {
                        "Effect": "Allow",
                        "Principal": {
                            "AWS": "<‘LatticeWorkshop InstanceClient2’ IAM ARN>"
                        },
                        "Action": "vpc-lattice-svcs:Invoke",
                        "Resource": "<ARN of Parking Service>/payments",
                        "Condition": {
                            "StringEquals": {
                                "vpc-lattice-svcs:RequestMethod": "GET"
                            }
                        }
                    }
                ]
}

