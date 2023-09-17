C9_IDS=$(aws cloud9 list-environments | jq -r '.environmentIds | join(" ")')
CLOUD9_EC2=$(aws cloud9 describe-environments --environment-ids "${C9_IDS}" | jq -r '.environments[] | select(.name == "LatticeCloud9") | .id')

sleep 60

CLOUD9_EC2_ID=$(aws ec2 describe-instances --region "${AWS_REGION}" \
--filters "Name=tag:aws:cloud9:environment,Values=${CLOUD9_EC2}" \
--query "Reservations[*].Instances[*].InstanceId" --output text)

aws ec2 associate-iam-instance-profile --instance-id "${CLOUD9_EC2_ID}" \
--iam-instance-profile Name=lattice-workshop-role --region "${AWS_REGION}"

aws cloud9 update-environment --environment-id "${CLOUD9_EC2}" --managed-credentials-action DISABLE

# aws cloud9 create-environment-membership --environment-id $CLOUD9_ENV_ID --user-arn arn:aws:iam::$AWS_ACCOUNT_ID_VALUE:root --permissions read-write

log_text "Success" "Cloud9 Environment created successfully..."