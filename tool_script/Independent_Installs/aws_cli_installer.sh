#! /bin/bash

install_aws_for_mac(){

    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "/usr/local/bin/AWSCLIV2.pkg"
    installer -pkg /usr/local/bin/AWSCLIV2.pkg -target / 
    
    if [[ -a /usr/local/bin/aws/aws ]]; then
        chmod +x /usr/local/bin/aws/aws
        echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.zshrc
    else
        echo "/usr/local/bin/aws/aws not found"
    fi

}

install_aws_for_x86() {

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/usr/local/bin/awscliv2.zip" 
    unzip /usr/local/bin/awscliv2.zip -d /usr/local/bin
    /usr/local/bin/aws/install || /usr/local/bin/aws/install --update
    
    if [[ -a /usr/local/bin/aws/aws ]]; then
        chmod +x /usr/local/bin/aws/aws
        echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.bashrc
    else
        echo "/usr/local/bin/aws/aws not found"
    fi

}

install_aws_for_arm() {

    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/usr/local/bin/awscliv2.zip"
    unzip /usr/local/bin/awscliv2.zip -d /usr/local/bin
    /usr/local/bin/aws/install || /usr/local/bin/aws/install --update
    
    if [[ -a /usr/local/bin/aws/aws ]]; then
        chmod +x /usr/local/bin/aws/aws
        echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.bashrc
    else
        echo "/usr/local/bin/aws/aws not found"
    fi

}