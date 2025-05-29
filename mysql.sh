if [ -z "$1" -a -z "$PASS" ]; then
    echo input password is missing, kindly kindly pass the password while executing.
    exit
elif [ -n "$1" ]; then
    PASSWD=$1
else
    PASSWD=${PASS}
fi  

dnf install mysql-server -y

systemctl enable mysqld
systemctl start mysqld  

mysql_secure_installation --set-root-pass ${PASSWD}

