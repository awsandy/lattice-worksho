aws cloud9 create-environment-ec2 --name LatticeCloud9 --description "LatticeCloud9 Environment." \
--instance-type "t3.small" --image-id resolve:ssm:/aws/service/cloud9/amis/amazonlinux-1-x86_64 \
--region $AWS_REGION --automatic-stop-time-minutes 300