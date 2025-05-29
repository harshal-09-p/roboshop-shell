source common.sh
component_name=catalogue
path=$(pwd)

nodejs
systemd_setup

cp ${path}/mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.harshaldevops.online </app/db/master-data.js