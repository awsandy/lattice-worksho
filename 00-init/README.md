## Stack LatticeBaseInfraWithAPIServer

Stack deploys
2 instances: LatticeWorkshop Rates LatticeWorkshop Payments (remove 22 0/0 rule)
sg allow 10 and 169.254.0.0/16
Instance profile
Keypair
Payments ASG, LT
Rates ASG, LT

Log group, bucket

VPC's (all 10.0.0.0/16)

LatticeWorkshop Clients                 IGW, NATGW
LatticeWorkshop Rates       (ec2)       IGW, NATGW rates-sg
LatticeWorkshop Payments    (ec2)       IGW, payments-sg
LatticeWorkshop Reservations(lambda)    IGW, reservations-sg, subnets, 



Lambda policy and role
Log group for lambda


Payments ALB, Listener, Target group




------
netstat -nap | grep dummy
systemctl start dummy-service

















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
