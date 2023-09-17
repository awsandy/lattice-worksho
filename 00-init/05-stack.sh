source ./env.sh
curl 'https://static.us-east-1.prod.workshops.aws/public/d03a4195-d09c-405e-b4c3-b46fd34923de/static/code/LatticeBaseInfraWithAPIServer.yaml' --output LatticeBaseInfraWithAPIServer.yaml

aws --region "${AWS_REGION}" \
    cloudformation deploy \
    --stack-name "${ENVIRONMENT_NAME}latticebaseinfrawithapiserver" \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --template-file "./LatticeBaseInfraWithAPIServer.yaml"