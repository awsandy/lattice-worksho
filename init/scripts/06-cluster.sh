export SOURCE_PATH="/home/ec2-user/environment/lattice"
mkdir $SOURCE_PATH
cd $SOURCE_PATH

curl 'https://static.us-east-1.prod.workshops.aws/public/9998036c-e8a7-4ec5-ba7a-eaf3599fcd8c/static/zip/scripts.zip' --output scripts.zip

unzip scripts.zip && rm scripts.zip

source $SOURCE_PATH/env.sh
./deploy-eks.sh