install_terraform_for_mac(){

    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
    brew update
    brew upgrade hashicorp/tap/terraform

}

install_terraform_for_deb(){

    apt-get update && sudo apt-get install -y gnupg software-properties-common curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    apt-get update && apt-get install terraform
    mv $(which terraform) /usr/local/bin/terraform

    if [[ -a /usr/local/bin/terraform ]]; then
        chmod +x /usr/local/bin/terraform
        echo "alias terraform='/usr/local/bin/terraform'" >> ~/.bashrc 
    else
        echo "/usr/local/bin/terraform not found"
    fi

}

install_terraform_for_dnf(){

    yum install -y yum-utils || dnf install -y dnf-plugins-core
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo || dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
    yum -y install terraform || dnf -y install terraform
    mv $(which terraform) /usr/local/bin/terraform

    if [[ -a /usr/local/bin/terraform ]]; then
        chmod +x /usr/local/bin/terraform
        echo "alias terraform='/usr/local/bin/terraform'" >> ~/.bashrc 
    else
        echo "/usr/local/bin/terraform not found"
    fi

}
