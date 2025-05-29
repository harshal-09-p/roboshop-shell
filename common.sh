systemd_setup() {
    systemctl daemon-reload
    systemctl enable ${component_name} 
    systemctl start ${component_name}
}

app_pre_setup() {
    useradd roboshop
    cp ${component_name}.service /etc/systemd/system/${component_name}.service
    rm -rf /app
    mkdir /app 
    curl -L -o /tmp/${component_name}.zip https://roboshop-artifacts.s3.amazonaws.com/${component_name}-v3.zip
    cd /app 
    unzip /tmp/${component_name}.zip
    cd /app 
}

nodejs() {
    dnf module disable nodejs -y
    dnf module enable nodejs:20 -y
    dnf install nodejs -y
    app_pre_setup
    npm install 
}

golang() {
    dnf install golang -y
    app_pre_setup
    go mod init ${component_name}
    go get 
    go build
}

python() {
    dnf install python3 gcc python3-devel -y
    app_pre_setup
    pip3 install -r requirements.txt
}

java() {
    dnf install maven -y
    app_pre_setup
    mvn clean package 
    mv target/${component_name}-1.0.jar ${component_name}.jar 
}
