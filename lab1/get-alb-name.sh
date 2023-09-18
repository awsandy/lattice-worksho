#!/bin/bash
# Exit if any of the intermediate steps fail
set -e
vpcid=$1
ALB_NAME=$(aws elbv2 describe-load-balancers | jq -r --arg v1 "$vpcid" '.LoadBalancers[] | select(.VpcId==$v1).LoadBalancerName')
jq -n --arg bn "$ALB_NAME" '{"Name":$bn}'
