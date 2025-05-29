if [-z "$1"]; then
    echo input password data is missing, kindly pass the password while executing.
    exit
fi
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo

dnf install rabbitmq-server -y

systemctl enable rabbitmq-server
systemctl start rabbitmq-server

rabbitmqctl add_user roboshop $1
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

