cd /home/ssm-user 
pdns=$(aws vpc-lattice list-services  | jq -r '.items[] | select(.name=="parking").dnsEntry.domainName')
rdns=$(aws vpc-lattice list-services  | jq -r '.items[] | select(.name=="reservation").dnsEntry.domainName')
echo $pdns
echo $rdns
 
for ((i=1;i<=30;i++)); do http $pdns/rates --auth-type lattice --auth s=vpc-lattice-svcs,r=eu-west-1; done
for ((i=1;i<=30;i++)); do http $pdns/payments --auth-type lattice --auth s=vpc-lattice-svcs,r=eu-west-1; done
for ((i=1;i<=30;i++)); do python3 signSigV4.py https://$rdns POST; done
for ((i=1;i<=30;i++)); do python3 signSigV4.py https://$rdns GET; done
for ((i=1;i<=30;i++)); do https $rdns --auth-type lattice --auth s=vpc-lattice-svcs,r=eu-west-1; done




