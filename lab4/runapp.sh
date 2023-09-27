#  https://github.com/aws-containers/retail-store-sample-app/blob/main/README.md
# 
# kubectl apply -f https://raw.githubusercontent.com/aws-containers/retail-store-sample-app/main/dist/kubernetes/deploy.yaml
kubectl apply -f app-deploy.yaml
echo "--> up to 8m wait for app to start"
kubectl wait --for=condition=available deployments --all --timeout=480s
kubectl get svc ui
# get elb url (port 80)

##
# kubectl delete -f https://raw.githubusercontent.com/aws-containers/retail-store-sample-app/main/dist/kubernetes/deploy.yaml
