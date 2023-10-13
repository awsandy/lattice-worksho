#!/bin/bash
LAMBDA_FUNCTION_NAME=${1}
# get vpcid of reservations vpc
VPC_ID=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=LatticeWorkshop Reservations VPC" --query "Vpcs[].VpcId" --output text)

default_sg=$(aws ec2 describe-security-groups --filters Name=description,Values='default VPC security group' Name=vpc-id,Values=${VPC_ID} --query 'SecurityGroups[0].GroupId')
default_sg=$(echo $default_sg | jq -r '.')
aws lambda update-function-configuration --function-name ${LAMBDA_FUNCTION_NAME} --vpc-config SecurityGroupIds=${default_sg}
