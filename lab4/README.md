aws ecr-public get-login-password --region us-east-1 | helm registry login --username AWS --password-stdin public.ecr.aws
export KUBE_CONFIG_PATH=~/.kube/config
terraform init
terraform apply -target="module.vpc" -auto-approve
terraform apply -target="module.eks" -auto-approve
terraform apply -target="module.karpenter" -auto-approve
terraform apply -auto-approve
#mv gateway.tf.sav gateway.tf 

kubectl apply -f gatewayclass.yaml

./runapp.sh
./lattice-app.sh
./dns.sh


## Destroy

#terraform destroy -target="module.eks_blueprints_addons" -auto-approve
terraform destroy -auto-approve
terraform destroy -target="module.eks" -auto-approve
terraform destroy -target="module.vpc" -auto-approve
