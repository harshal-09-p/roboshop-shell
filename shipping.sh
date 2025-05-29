set -e

component_name=shipping
path=$(pwd)
source $(pwd)/common.sh

if [ -z "$1" ]; then
    echo input DB password is missing, kindly pass while executing.
    exit
fi

java

systemd_setup

dnf install mysql -y 

for file in schema app-user master-data; do 
    mysql -h mysql-dev.harshaldevops.online -uroot -p$1 < /app/db/$file.sql
done

systemctl restart shipping