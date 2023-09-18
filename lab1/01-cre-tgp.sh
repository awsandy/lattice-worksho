# cre tgt grp
aws vpc-lattice create-target-group --name reservation-tg --type LAMBDA 
tgarn=$(aws vpc-lattice list-target-groups | jq -r '.items[] | select(.name=="reservation-tg").arn')
fnarn=$(aws lambda list-functions | jq -r '.Functions[] | select(.FunctionName=="LatticeReservationLambda").FunctionArn')
aws vpc-lattice register-targets --target-group-identifier $tgarn --targets id=$fnarn
# rates
aws vpc-lattice create-target-group --name rates-tg --type INSTANCE


# payments
aws vpc-lattice create-target-group --name rates-tg --type ALB
