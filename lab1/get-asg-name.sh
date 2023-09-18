#!/bin/bash
# Exit if any of the intermediate steps fail
set -e
ASG_NAME=$(aws autoscaling describe-auto-scaling-groups --query 'AutoScalingGroups[].AutoScalingGroupName' | jq -r '.[]' | grep RatesASG)
jq -n --arg bn "$ASG_NAME" '{"Name":$bn}'
