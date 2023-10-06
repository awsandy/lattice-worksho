cd /Users/awsandy/odp/aws/sw/Lattice/workshop/lab1
sed -i'.orig' -e 's/NONE/AWS_IAM/g' aws_vpclattice_service__svc-parking.tf
sed -i'.orig' -e  's/NONE/AWS_IAM/g' aws_vpclattice_service_network__sn-09c95c9b9ab29e33e.tf
terraform apply -auto-approve
cd /Users/awsandy/odp/aws/sw/Lattice/workshop/lab1
sed -i'.orig' -e 's/AWS_IAM/NONE/g' aws_vpclattice_service__svc-parking.tf
sed -i'.orig' -e  's/AWS_IAM/NONE/g' aws_vpclattice_service_network__sn-09c95c9b9ab29e33e.tf

# AWS_IAM
snid=$(aws vpc-lattice list-service-networks | jq -r '.items[] | select(.name=="superappsvcnetwork").id')
aws vpc-lattice update-service-network --auth-type AWS_IAM --service-network-identifier $snid
psid=$(aws vpc-lattice list-services | jq -r '.items[] | select(.name=="parking").id')
aws vpc-lattice update-service --auth-type AWS_IAM --service-identifier $psid
#


# NONE
snid=$(aws vpc-lattice list-service-networks | jq -r '.items[] | select(.name=="superappsvcnetwork").id')
aws vpc-lattice update-service-network --auth-type NONE --service-network-identifier $snid
psid=$(aws vpc-lattice list-services | jq -r '.items[] | select(.name=="parking").id')
aws vpc-lattice update-service --auth-type NONE --service-identifier $psid
#