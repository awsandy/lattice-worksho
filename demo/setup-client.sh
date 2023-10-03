# AWS cli
cd /home/ssm-user/
sudo yum -y install jq
#
# AWS cli v2 is now the default in cloud9
#
echo "Uninstall AWS CLI v1"
sudo /usr/local/bin/pip uninstall awscli -y 2&> /dev/null
sudo pip uninstall awscli -y 2&> /dev/null
echo "Install AWS CLI v2"
curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" > /dev/null
unzip -qq awscliv2.zip
sudo ./aws/install > /dev/null
echo "alias aws='/usr/local/bin/aws'" >> ~/.bash_profile
source ~/.bash_profile
rm -f awscliv2.zip
rm -rf aws

# other stuff

wget https://d3fh841oeihish.cloudfront.net/signSigV4.py
sed -i.orig -e 's/us-west-2/eu-west-1/g' /home/ssm-user/signSigV4.py
pip3 install botocore
pip3 install requests
#

# Install httpie
pip3 install httpie
#https POST pie.dev/post hello=world
#http GET pie.dev/get
cd /home/ssm-user/
pip3 install boto3
aws s3 cp s3://event-engine-eu-west-1/httpie/http-lattice.tar http-lattice.tar
tar -xf http-lattice.tar
cd Httpie-Lattice-Auth
httpie cli plugins install .






