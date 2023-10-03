trole=$(aws sts get-caller-identity --query Arn --output text  | cut -f2 -d"/")
AWS_SESSION_TOKEN=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$trole | jq -r '.Token')
AWS_ACCESS_KEY_ID=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$trole | jq -r '.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$trole | jq -r '.SecretAccessKey')
echo $AWS_ACCESS_KEY_ID
pdns=$(aws vpc-lattice list-services  | jq -r '.items[] | select(.name=="parking").dnsEntry.domainName')
rdns=$(aws vpc-lattice list-services  | jq -r '.items[] | select(.name=="reservation").dnsEntry.domainName')
echo $pdns
echo $rdns
curl https://$rdns
curl http://$pdns/rates
curl http://$pdns/payments
#



