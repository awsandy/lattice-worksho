terraform init
terraform apply -target="module.vpc" -auto-approve
terraform apply -target="module.eks" -auto-approve
terraform apply -auto-approve




## Destroy

terraform destroy -target="module.eks_blueprints_addons" -auto-approve
terraform destroy -target="module.eks" -auto-approve
terraform destroy -auto-approve