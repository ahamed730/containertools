#! /bin/bash

install_aws_for_mac(){

    sudo curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "/usr/local/bin/AWSCLIV2.pkg" || curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "/usr/local/bin/AWSCLIV2.pkg"
    sudo installer -pkg /usr/local/bin/AWSCLIV2.pkg -target / || installer -pkg /usr/local/bin/AWSCLIV2.pkg -target /
    sudo echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.zshrc || echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.zshrc
    sudo source ~/.zshrc || source ~/.zshrc

}

install_aws_for_x86() {

    sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/usr/local/bin/awscliv2.zip" || curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/usr/local/bin/awscliv2.zip"
    sudo unzip /usr/local/bin/awscliv2.zip -d /usr/local/bin || unzip /usr/local/bin/awscliv2.zip -d /usr/local/bin
    sudo /usr/local/bin/aws/install || sudo /usr/local/bin/aws/install --update || /usr/local/bin/aws/install || /usr/local/bin/aws/install --update
    sudo echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.bashrc || echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.bashrc
    sudo source ~/.bashrc || source ~/.bashrc

}

install_aws_for_arm() {

    sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/usr/local/bin/awscliv2.zip" || curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "/usr/local/bin/awscliv2.zip"
    sudo unzip /usr/local/bin/awscliv2.zip -d /usr/local/bin || unzip /usr/local/bin/awscliv2.zip -d /usr/local/bin
    sudo /usr/local/bin/aws/install || sudo /usr/local/bin/aws/install --update || /usr/local/bin/aws/install || /usr/local/bin/aws/install --update
    sudo echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.bashrc || echo "alias aws='/usr/local/bin/aws/aws'" >> ~/.bashrc 
    sudo source ~/.bashrc || ~/.bashrc

}