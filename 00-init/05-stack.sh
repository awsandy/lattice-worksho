
curl 'https://static.us-east-1.prod.workshops.aws/public/d03a4195-d09c-405e-b4c3-b46fd34923de/static/code/LatticeBaseInfraWithAPIServer.yaml' --output LatticeBaseInfraWithAPIServer.yaml

aws  \
    cloudformation deploy \
    --stack-name "latticebaseinfrawithapiserver" \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --template-file "./LatticeBaseInfraWithAPIServer.yaml"