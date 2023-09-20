#!/bin/bash
echo 'Stack testlatticebaseinfrawithapiserver Importing 0 of 95 ..'
../../scripts/050-get-iam-roles.sh testlatticebaseinfrawithapiserver-IamRoleLambdaCFn-151LS2SKHVS7X
echo 'Stack testlatticebaseinfrawithapiserver Importing 1 of 95 ..'
../../scripts/251-get-ec2-instances.sh i-0c8863041f376c78e
echo 'Stack testlatticebaseinfrawithapiserver Importing 2 of 95 ..'
../../scripts/251-get-ec2-instances.sh i-0d2177a70c5cd8982
echo 'Stack testlatticebaseinfrawithapiserver Importing 3 of 95 ..'
../../scripts/056-get-iam-instance-profile.sh testlatticebaseinfrawithapiserver-InstanceProfile-sMdf0JeyeprL
echo 'Stack testlatticebaseinfrawithapiserver Importing 4 of 95 ..'
echo '#  AWS::EC2::VPCGatewayAttachment testl-Inter-1HMSL7ZN1209K attached as part of IGW etc ..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 5 of 95 ..'
echo '#  AWS::EC2::VPCGatewayAttachment testl-Inter-1TAJ3N0SNNJVY attached as part of IGW etc ..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 6 of 95 ..'
echo '#  AWS::EC2::VPCGatewayAttachment testl-Inter-N4EIOUIHPRPU attached as part of IGW etc ..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 7 of 95 ..'
echo '#  AWS::EC2::VPCGatewayAttachment testl-Inter-RVE2HMZTUODV attached as part of IGW etc ..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 8 of 95 ..'
../../scripts/120-get-igw.sh igw-09a4265d6d08afd54
echo 'Stack testlatticebaseinfrawithapiserver Importing 9 of 95 ..'
../../scripts/120-get-igw.sh igw-095fc0e0738ebf326
echo 'Stack testlatticebaseinfrawithapiserver Importing 10 of 95 ..'
../../scripts/120-get-igw.sh igw-0f72e5eff01eaf04b
echo 'Stack testlatticebaseinfrawithapiserver Importing 11 of 95 ..'
../../scripts/120-get-igw.sh igw-07df5f22959160af7
echo 'Stack testlatticebaseinfrawithapiserver Importing 12 of 95 ..'
../../scripts/get-iam-policies.sh arn:aws:iam::566972129213:policy/InvokeLatticePolicy
echo 'Stack testlatticebaseinfrawithapiserver Importing 13 of 95 ..'
../../scripts/get-iam-policies.sh arn:aws:iam::566972129213:policy/Lattice-Lambda-Policy
echo 'Stack testlatticebaseinfrawithapiserver Importing 14 of 95 ..'
../../scripts/050-get-iam-roles.sh Lattice-Lambda-Role
echo 'Stack testlatticebaseinfrawithapiserver Importing 15 of 95 ..'
../../scripts/700-get-lambda-function.sh LatticeReservationLambda
echo 'Stack testlatticebaseinfrawithapiserver Importing 16 of 95 ..'
../../scripts/070-get-cw-log-grp.sh //aws/lambda/LatticeReservationLambda
echo 'Stack testlatticebaseinfrawithapiserver Importing 17 of 95 ..'
../../scripts/253-get-key-pairs.sh LatticeWorkshop
echo 'Stack testlatticebaseinfrawithapiserver Importing 18 of 95 ..'
../../scripts/258-get-autoscaling-groups.sh testlatticebaseinfrawithapiserver-PaymentsASG-1409F0PXQNT6K
echo 'Stack testlatticebaseinfrawithapiserver Importing 19 of 95 ..'
../../scripts/eks-launch_template.sh lt-05a68757283c6e194
echo 'Stack testlatticebaseinfrawithapiserver Importing 20 of 95 ..'
../../scripts/elbv2_listener.sh arn:aws:elasticloadbalancing:eu-west-1:566972129213:listener/app/testl-Payme-UNPBI1NL9VPA/5ee6b15c48e1c3fa/f3646061e81dba93
echo 'Stack testlatticebaseinfrawithapiserver Importing 21 of 95 ..'
../../scripts/elbv2.sh arn:aws:elasticloadbalancing:eu-west-1:566972129213:loadbalancer/app/testl-Payme-UNPBI1NL9VPA/5ee6b15c48e1c3fa
echo 'Stack testlatticebaseinfrawithapiserver Importing 22 of 95 ..'
../../scripts/elbv2-target-groups.sh arn:aws:elasticloadbalancing:eu-west-1:566972129213:targetgroup/payments-target-group/8fa7228052d0bd8c
echo 'Stack testlatticebaseinfrawithapiserver Importing 23 of 95 ..'
../../scripts/258-get-autoscaling-groups.sh testlatticebaseinfrawithapiserver-RatesASG-16HVW360AFWPF
echo 'Stack testlatticebaseinfrawithapiserver Importing 24 of 95 ..'
../../scripts/eks-launch_template.sh lt-0692233e69efb7d98
echo 'Stack testlatticebaseinfrawithapiserver Importing 25 of 95 ..'
../../scripts/050-get-iam-roles.sh testlatticebaseinfrawithapiserver-SSMRole-1CDQNUHP1D78M
echo 'Stack testlatticebaseinfrawithapiserver Importing 26 of 95 ..'
../../scripts/100-get-vpc.sh vpc-0552cbf8549150e66
echo 'Stack testlatticebaseinfrawithapiserver Importing 27 of 95 ..'
echo '#  AWS::EC2::Route 0  fetched as part of RouteTable..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 28 of 95 ..'
../../scripts/get-eip.sh 54.171.153.116
echo 'Stack testlatticebaseinfrawithapiserver Importing 29 of 95 ..'
../../scripts/130-get-natgw.sh nat-020adc6e1f0f06855
echo 'Stack testlatticebaseinfrawithapiserver Importing 30 of 95 ..'
../../scripts/140-get-route-table.sh rtb-074aa48c67f043297
echo 'Stack testlatticebaseinfrawithapiserver Importing 31 of 95 ..'
echo '#  AWS::EC2::Route 0  fetched as part of RouteTable..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 32 of 95 ..'
../../scripts/105-get-subnet.sh subnet-063b5eacd2d6cb0d3
echo 'Stack testlatticebaseinfrawithapiserver Importing 33 of 95 ..'
../../scripts/105-get-subnet.sh subnet-00efde0a26c7c24e8
echo 'Stack testlatticebaseinfrawithapiserver Importing 34 of 95 ..'
../../scripts/105-get-subnet.sh subnet-0b6d0d667c4d5f0b7
echo 'Stack testlatticebaseinfrawithapiserver Importing 35 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0c659808403c730d7
echo 'Stack testlatticebaseinfrawithapiserver Importing 36 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0d810295612d5b8b4
echo 'Stack testlatticebaseinfrawithapiserver Importing 37 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0a9875ccf03dbe632
echo 'Stack testlatticebaseinfrawithapiserver Importing 38 of 95 ..'
../../scripts/140-get-route-table.sh rtb-07490a3a02fdf0258
echo 'Stack testlatticebaseinfrawithapiserver Importing 39 of 95 ..'
../../scripts/105-get-subnet.sh subnet-080945eca077e4a32
echo 'Stack testlatticebaseinfrawithapiserver Importing 40 of 95 ..'
../../scripts/105-get-subnet.sh subnet-08ff2bb366da64167
echo 'Stack testlatticebaseinfrawithapiserver Importing 41 of 95 ..'
../../scripts/105-get-subnet.sh subnet-05e1cdb735563b88d
echo 'Stack testlatticebaseinfrawithapiserver Importing 42 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-076639c164c3afab0
echo 'Stack testlatticebaseinfrawithapiserver Importing 43 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-06b36fe26a9c3cece
echo 'Stack testlatticebaseinfrawithapiserver Importing 44 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0675712462a396060
echo 'Stack testlatticebaseinfrawithapiserver Importing 45 of 95 ..'
../../scripts/110-get-security-group.sh sg-03d872da0ef11f465
echo 'Stack testlatticebaseinfrawithapiserver Importing 46 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCASecurityGroupIngress1 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 47 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCASecurityGroupIngress2 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 48 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCASecurityGroupIngress3 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 49 of 95 ..'
../../scripts/100-get-vpc.sh vpc-03ad2d3d2947ce3f5
echo 'Stack testlatticebaseinfrawithapiserver Importing 50 of 95 ..'
echo '#  AWS::EC2::Route 0  fetched as part of RouteTable..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 51 of 95 ..'
../../scripts/get-eip.sh 52.208.237.59
echo 'Stack testlatticebaseinfrawithapiserver Importing 52 of 95 ..'
../../scripts/130-get-natgw.sh nat-05a99a78532c99404
echo 'Stack testlatticebaseinfrawithapiserver Importing 53 of 95 ..'
../../scripts/140-get-route-table.sh rtb-01a5944d2392c4997
echo 'Stack testlatticebaseinfrawithapiserver Importing 54 of 95 ..'
echo '#  AWS::EC2::Route 0  fetched as part of RouteTable..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 55 of 95 ..'
../../scripts/105-get-subnet.sh subnet-01e8f537bc66d049a
echo 'Stack testlatticebaseinfrawithapiserver Importing 56 of 95 ..'
../../scripts/105-get-subnet.sh subnet-090a5439929b42670
echo 'Stack testlatticebaseinfrawithapiserver Importing 57 of 95 ..'
../../scripts/105-get-subnet.sh subnet-03711fd0b665b596c
echo 'Stack testlatticebaseinfrawithapiserver Importing 58 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0b6a52b8d1af5d7c5
echo 'Stack testlatticebaseinfrawithapiserver Importing 59 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0ee46c85d237dfdf8
echo 'Stack testlatticebaseinfrawithapiserver Importing 60 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-08042e001fe4bae0b
echo 'Stack testlatticebaseinfrawithapiserver Importing 61 of 95 ..'
../../scripts/140-get-route-table.sh rtb-06b5721bd6c57d41e
echo 'Stack testlatticebaseinfrawithapiserver Importing 62 of 95 ..'
../../scripts/105-get-subnet.sh rates-pub1
echo 'Stack testlatticebaseinfrawithapiserver Importing 63 of 95 ..'
../../scripts/105-get-subnet.sh subnet-0d9ea4c467ebf34d3
echo 'Stack testlatticebaseinfrawithapiserver Importing 64 of 95 ..'
../../scripts/105-get-subnet.sh subnet-054190ca217d10c51
echo 'Stack testlatticebaseinfrawithapiserver Importing 65 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-06ee06009ba37f594
echo 'Stack testlatticebaseinfrawithapiserver Importing 66 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-02a75671385a3842a
echo 'Stack testlatticebaseinfrawithapiserver Importing 67 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-05fdb01bf7d59aac2
echo 'Stack testlatticebaseinfrawithapiserver Importing 68 of 95 ..'
../../scripts/110-get-security-group.sh sg-04c2eaaaf6f61e5a1
echo 'Stack testlatticebaseinfrawithapiserver Importing 69 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCBSecurityGroupIngress1 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 70 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCBSecurityGroupIngress2 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 71 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCBSecurityGroupIngress3 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 72 of 95 ..'
../../scripts/100-get-vpc.sh vpc-0a0c8bc0956c0b09e
echo 'Stack testlatticebaseinfrawithapiserver Importing 73 of 95 ..'
echo '#  AWS::EC2::Route 0  fetched as part of RouteTable..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 74 of 95 ..'
../../scripts/140-get-route-table.sh rtb-08c2fe56e72e4e9cc
echo 'Stack testlatticebaseinfrawithapiserver Importing 75 of 95 ..'
../../scripts/105-get-subnet.sh subnet-0b30aa46e410c903d
echo 'Stack testlatticebaseinfrawithapiserver Importing 76 of 95 ..'
../../scripts/105-get-subnet.sh subnet-083f84ab40f5df076
echo 'Stack testlatticebaseinfrawithapiserver Importing 77 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-06e72ed49c8a52107
echo 'Stack testlatticebaseinfrawithapiserver Importing 78 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0daa1c5a7b1a8542b
echo 'Stack testlatticebaseinfrawithapiserver Importing 79 of 95 ..'
../../scripts/110-get-security-group.sh sg-08f0a156dbeb9724b
echo 'Stack testlatticebaseinfrawithapiserver Importing 80 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCCSecurityGroupIngress1 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 81 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCCSecurityGroupIngress2 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 82 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCCSecurityGroupIngress3 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 83 of 95 ..'
../../scripts/100-get-vpc.sh vpc-06977ec8dcb8f6e81
echo 'Stack testlatticebaseinfrawithapiserver Importing 84 of 95 ..'
echo '#  AWS::EC2::Route 0  fetched as part of RouteTable..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 85 of 95 ..'
../../scripts/140-get-route-table.sh rtb-0a39330951b04ddfa
echo 'Stack testlatticebaseinfrawithapiserver Importing 86 of 95 ..'
../../scripts/105-get-subnet.sh subnet-08f8608099eb8cecb
echo 'Stack testlatticebaseinfrawithapiserver Importing 87 of 95 ..'
../../scripts/105-get-subnet.sh subnet-04e4d0bf90c44cd56
echo 'Stack testlatticebaseinfrawithapiserver Importing 88 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-07d2c822039e2a815
echo 'Stack testlatticebaseinfrawithapiserver Importing 89 of 95 ..'
../../scripts/141-get-route-table-associations.sh rtbassoc-0ae8afcf9792849b2
echo 'Stack testlatticebaseinfrawithapiserver Importing 90 of 95 ..'
../../scripts/110-get-security-group.sh sg-067dfe4dec422ce60
echo 'Stack testlatticebaseinfrawithapiserver Importing 91 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCDSecurityGroupIngress1 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 92 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCDSecurityGroupIngress2 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 93 of 95 ..'
echo '# AWS::EC2::SecurityGroupIngress VPCDSecurityGroupIngress3 fetched as part of SecurityGroup..'
echo 'Stack testlatticebaseinfrawithapiserver Importing 94 of 95 ..'
../../scripts/070-get-cw-log-grp.sh //latticeworkshop/parking-svc-logs
echo 'Stack testlatticebaseinfrawithapiserver Importing 95 of 95 ..'
../../scripts/060-get-s3.sh superappsvcnetworklogs566972129213
echo "Commands Done .."
