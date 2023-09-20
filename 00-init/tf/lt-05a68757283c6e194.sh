#!/bin/bash
sudo su
wget https://d3fh841oeihish.cloudfront.net/dummy-service
chmod +x dummy-service
echo $'[Unit]\nDescription=dummy-service\nAfter=network.target\n\n[Service]\nType=simple\nWorkingDirectory=/\nExecStart=/dummy-service\nExecReload=/bin/kill -HUP $MAINPID\nRestart=always\nStandardOutput=syslog\nStandardError=syslog\nSyslogIdentifier=dummy-service\nUser=root\nGroup=root\nEnvironment=SERVICE_NAME="payments"\n\n[Install]\nWantedBy=multi-user.target\n' > /etc/systemd/system/dummy-service.service
systemctl start dummy-service
