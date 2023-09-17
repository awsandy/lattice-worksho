aws iam create-role --path / \
--role-name lattice-workshop-role \
--description "Role used by VPC Lattice Cloud9 environment" \
--assume-role-policy-document "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"ec2.amazonaws.com\"]},\"Action\":[\"sts:AssumeRole
\"]}]}"

aws iam attach-role-policy --role-name lattice-workshop-role --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

aws iam create-instance-profile --instance-profile-name lattice-workshop-role

aws iam add-role-to-instance-profile --instance-profile-name lattice-workshop-role --role-name lattice-workshop-role