export AWS_REGION=$(aws configure get region)
export VPC1_NAME='LatticeWorkshop Clients VPC'
export VPC1_FILTER="Name=tag:Name,Values='$VPC1_NAME'"
export VPC2_NAME='LatticeWorkshop Rates VPC'
export VPC2_FILTER="Name=tag:Name,Values='$VPC2_NAME'"


export LATTICE_DOMAIN_NAME="lattice.io"
export CLUSTER1_NAME=$(terraform output -raw cluster_name)
export VPC2_NAME='LatticeWorkshop Rates VPC'
export VPC2_FILTER="Name=tag:Name,Values='$VPC2_NAME'"

export ASSETS_HOSTNAME="assets-${CLUSTER1_NAME}"
export CART_HOSTNAME="carts-${CLUSTER1_NAME}"
export CATALOG_HOSTNAME="catalog-${CLUSTER1_NAME}"
export CHECKOUT_HOSTNAME="checkout-${CLUSTER1_NAME}"
export ORDERS_HOSTNAME="orders-${CLUSTER1_NAME}"
export CARTS_HOSTNAME="carts-${CLUSTER1_NAME}"

export ASSETS_FQDN="${ASSETS_HOSTNAME}.${LATTICE_DOMAIN_NAME}"
export CARTS_FQDN="${CART_HOSTNAME}.${LATTICE_DOMAIN_NAME}"
export CATALOG_FQDN="${CATALOG_HOSTNAME}.${LATTICE_DOMAIN_NAME}"
export CHECKOUT_FQDN="${CHECKOUT_HOSTNAME}.${LATTICE_DOMAIN_NAME}"
export ORDERS_FQDN="${ORDERS_HOSTNAME}.${LATTICE_DOMAIN_NAME}"

echo $CARTS_FQDN
echo $ASSETS_FQDN
echo $CATALOG_FQDN
echo $CHECKOUT_FQDN
echo $ORDERS_FQDN

ASSETS_LATTICE_FQDN=$(kubectl  get httproute ${CLUSTER1_NAME}-assets -o yaml | yq ' .metadata.annotations."application-networking.k8s.aws/lattice-assigned-domain-name"')
CART_LATTICE_FQDN=$(kubectl  get httproute ${CLUSTER1_NAME}-carts -o yaml | yq ' .metadata.annotations."application-networking.k8s.aws/lattice-assigned-domain-name"')
CATALOG_LATTICE_FQDN=$(kubectl  get httproute ${CLUSTER1_NAME}-catalog -o yaml | yq ' .metadata.annotations."application-networking.k8s.aws/lattice-assigned-domain-name"')

echo $ASSETS_LATTICE_FQDN
echo $CART_LATTICE_FQDN
echo $CATALOG_LATTICE_FQDN

export VPC1_ID=$(aws ssm get-parameter --name "/vpclattice/workshop/vpc-clients" --with-decryption --query 'Parameter.Value' --output text)
export VPC2_ID=$(aws ssm get-parameter --name "/vpclattice/workshop/vpc-rates" --with-decryption --query 'Parameter.Value' --output text)

PRIVATE_HOSTED_ZONE_ID=$(aws route53 create-hosted-zone --name "${LATTICE_DOMAIN_NAME}" --caller-reference "$(date +%Y%m%d%H%M%S)" --vpc VPCRegion="${AWS_REGION}",VPCId="${VPC1_ID}" --hosted-zone-config PrivateZone=true --query 'HostedZone.Id' --output text)
aws route53 associate-vpc-with-hosted-zone --hosted-zone-id "${PRIVATE_HOSTED_ZONE_ID}" --vpc VPCRegion="${AWS_REGION}",VPCId="${VPC2_ID}"

export SVC_FQDN=$ASSETS_FQDN
export LATTICE_FQDN="${ASSETS_LATTICE_FQDN}"
envsubst < cname.json > assets-dns.json
aws route53 change-resource-record-sets --hosted-zone-id $PRIVATE_HOSTED_ZONE_ID --region $AWS_REGION --change-batch file://assets-dns.json

export SVC_FQDN=$CARTS_FQDN
export LATTICE_FQDN=${CART_LATTICE_FQDN}
envsubst < cname.json > cart-dns.json
aws route53 change-resource-record-sets --hosted-zone-id $PRIVATE_HOSTED_ZONE_ID --region $AWS_REGION --change-batch file://cart-dns.json

export SVC_FQDN="$CATALOG_FQDN"
export LATTICE_FQDN="${CATALOG_LATTICE_FQDN}"
envsubst < cname.json > catalog-dns.json
aws route53 change-resource-record-sets --hosted-zone-id $PRIVATE_HOSTED_ZONE_ID --region $AWS_REGION --change-batch file://catalog-dns.json



