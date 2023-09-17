source ./env.sh

## deploy stack
```  bash
curl 'https://static.us-east-1.prod.workshops.aws/public/d03a4195-d09c-405e-b4c3-b46fd34923de/static/code/LatticeBaseInfraWithAPIServer.yaml' --output LatticeBaseInfraWithAPIServer.yaml

aws --region "${AWS_REGION}" \
    cloudformation deploy \
    --stack-name "${ENVIRONMENT_NAME}latticebaseinfrawithapiserver" \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --template-file "./LatticeBaseInfraWithAPIServer.yaml"
```

##deploy EKS

```bash
export SOURCE_PATH="/home/ec2-user/environment/lattice"
mkdir $SOURCE_PATH
cd $SOURCE_PATH

curl 'https://static.us-east-1.prod.workshops.aws/public/d03a4195-d09c-405e-b4c3-b46fd34923de/static/zip/scripts.zip' --output scripts.zip

unzip scripts.zip && rm scripts.zip

source $SOURCE_PATH/env.sh

./deploy-eks.sh
```
