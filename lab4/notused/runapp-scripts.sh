#  https://github.com/aws-containers/retail-store-sample-app/blob/main/README.md
# 
# kubectl apply -f https://raw.githubusercontent.com/aws-containers/retail-store-sample-app/main/dist/kubernetes/deploy.yaml
export LATTICE_DOMAIN_NAME="lattice.io"
export CLUSTER1_NAME=$(terraform output -raw cluster_name)
export VPC2_NAME='LatticeWorkshop Rates VPC'
export VPC2_FILTER="Name=tag:Name,Values='$VPC2_NAME'"

export ASSETS_HOSTNAME="assets-${CLUSTER1_NAME}"
export CART_HOSTNAME="cart-${CLUSTER1_NAME}"
export CATALOG_HOSTNAME="catalog-${CLUSTER1_NAME}"
export CHECKOUT_HOSTNAME="checkout-${CLUSTER1_NAME}"

export ASSETS_FQDN="${ASSETS_HOSTNAME}.${LATTICE_DOMAIN_NAME}"
export CART_FQDN="${CART_HOSTNAME}.${LATTICE_DOMAIN_NAME}"
export CATALOG_FQDN="${CATALOG_HOSTNAME}.${LATTICE_DOMAIN_NAME}"
export CHECKOUT_FQDN="${CHECKOUT_HOSTNAME}.${LATTICE_DOMAIN_NAME}"

echo $CART_FQDN
echo $ASSETS_FQDN
echo $CATALOG_FQDN
echo $CHECKOUT_FQDN

envsubst < scripts/rs-deploy-app-c1-var.yaml | kubectl apply -f -
echo "--> up to 8m wait for app to start"
kubectl wait --for=condition=available deployments -- --timeout=480s
echo "--> app started, deployments wait complete"
kubectl get svc ui-lb -n ui
# get elb url (port 80)

##
# kubectl delete -f https://raw.githubusercontent.com/aws-containers/retail-store-sample-app/main/dist/kubernetes/deploy.yaml
APP_URL=$(kubectl --context "${CLUSTER1_NAME}" get svc ui-lb -n ui -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo $APP_URL
