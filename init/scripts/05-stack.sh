
curl 'https://static.us-east-1.prod.workshops.aws/public/9998036c-e8a7-4ec5-ba7a-eaf3599fcd8c/static/code/LatticeBaseInfraWithAPIServer.yaml' --output LatticeBaseInfraWithAPIServer.yaml

export ENVIRONMENT_NAME=test

aws --region "${AWS_REGION}" \
    cloudformation deploy \
    --stack-name "${ENVIRONMENT_NAME}latticebaseinfrawithapiserver" \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --template-file "./LatticeBaseInfraWithAPIServer.yaml"
