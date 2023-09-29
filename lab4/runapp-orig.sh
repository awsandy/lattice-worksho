#  https://github.com/aws-containers/retail-store-sample-app/blob/main/README.md
# 
rm -f deploy.yaml.* deploy.yaml
wget https://raw.githubusercontent.com/aws-containers/retail-store-sample-app/main/dist/kubernetes/deploy.yaml
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

grep ENDPOINTS_ deploy.yaml

kubectl apply -f deploy.yaml
echo "--> up to 8m wait for app to start"
kubectl wait --for=condition=available deployments --all --timeout=480s
echo "--> app started, deployments wait complete"

#kubectl get svc ui
# get elb url (port 80)

##
# kubectl delete -f https://raw.githubusercontent.com/aws-containers/retail-store-sample-app/main/dist/kubernetes/deploy.yaml
APP_URL=$(kubectl --context "${CLUSTER1_NAME}" get svc ui -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo $APP_URL

echo "wait for 11 running pods in default namespace"
rp=$(kubectl get pods -n default | grep Running | wc -l)
while [[ $rp -lt 11 ]];do
echo "$rp pods running sleep 10s"
sleep 10
rp=$(kubectl get pods -n default | grep Running | wc -l)
done

kubectl  get pods -l app.kubernetes.io/component=service,app.kuberneres.io/owner=retail-store-sample -A
#
kubectl  get cm ui -o yaml | yq .data 

#kubectl  get httproute ${CLUSTER1_NAME}-assets -n assets -o yaml | yq ' .metadata.annotations."application-networking.k8s.aws/lattice-assigned-domain-name"'
