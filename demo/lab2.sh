trole=$(aws sts get-caller-identity --query Arn --output text  | cut -f2 -d"/")
echo "apply lab2 terraform first  AND flip acces to AWS_IAM"
AWS_SESSION_TOKEN=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$trole | jq -r '.Token')
AWS_ACCESS_KEY_ID=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$trole | jq -r '.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$trole | jq -r '.SecretAccessKey')
echo $AWS_ACCESS_KEY_ID
pdns=$(aws vpc-lattice list-services  | jq -r '.items[] | select(.name=="parking").dnsEntry.domainName')
rdns=$(aws vpc-lattice list-services  | jq -r '.items[] | select(.name=="reservation").dnsEntry.domainName')
echo "should fail"
curl https://$rdns
curl http://$pdns/rates
curl http://$pdns/payments
echo "should work ..."
curl https://$rdns --aws-sigv4 "aws:amz:eu-west-1:vpc-lattice-svcs" --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" --header "x-amz-security-token:$AWS_SESSION_TOKEN" --header "x-amz-content-sha256:UNSIGNED-PAYLOAD"
curl http://$pdns/rates --aws-sigv4 "aws:amz:eu-west-1:vpc-lattice-svcs" --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" --header "x-amz-security-token:$AWS_SESSION_TOKEN" --header "x-amz-content-sha256:UNSIGNED-PAYLOAD"
curl http://$pdns/payments --aws-sigv4 "aws:amz:eu-west-1:vpc-lattice-svcs" --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" --header "x-amz-security-token:$AWS_SESSION_TOKEN" --header "x-amz-content-sha256:UNSIGNED-PAYLOAD"
echo "should fail ..."
curl -d "hello=world" -X POST http://$pdns/payments --aws-sigv4 "aws:amz:eu-west-1:vpc-lattice-svcs" --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" --header "x-amz-security-token:$AWS_SESSION_TOKEN" --header "x-amz-content-sha256:UNSIGNED-PAYLOAD"
#
