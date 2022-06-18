install_tkn_for_rpm() {

    rpm -Uvh -f --reinstall https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-64bit.rpm
    if [[ -z "$(which tkn)" ]]; then
        dnf copr enable chmouel/tektoncd-cli && dnf install tektoncd-cli
    fi
}

install_tkn_for_rpm_arm() {

    rpm -Uvh -f --reinstall https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-ARM64.rpm
    if [[ -z "$(which tkn)" ]]; then
        dnf copr enable chmouel/tektoncd-cli && dnf install tektoncd-cli
    fi
}


install_tkn_for_deb() {
    
    apt update
    apt install -y gnupg
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA ||
    echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list 
    apt update && apt install -y tektoncd-cli
    
    if [[ -z "$(which tkn)" ]]; then
        curl -L "https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-64bit.deb" -o /usr/local/bin/tektoncd-cli-0.24.0_Linux-64bit.deb && dpkg -i /usr/local/bin/tektoncd-cli-0.24.0_Linux-64bit.deb
    elif [[ -a  /usr/local/bin/tkn ]]; then
        chmod +x /usr/local/bin/tkn
        echo "alias tkn='/usr/local/bin/tkn" >> ~/.bashrc
    fi
}

install_tkn_for_deb_arm() {

    apt update
    apt install -y gnupg
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
    echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
    apt update && apt install -y tektoncd-cli
    
    if [[ -z "$(which tkn)" ]]; then
        curl -L "https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-ARM64.deb" -o /usr/local/bin/tektoncd-cli-0.24.0_Linux-ARM64.deb && dpkg -i /usr/local/bin/tektoncd-cli-0.24.0_Linux-ARM64bit.deb 
    elif [[ -a  /usr/local/bin/tkn ]]; then
        chmod +x /usr/local/bin/tkn
        echo "alias tkn='/usr/local/bin/tkn" >> ~/.bashrc 
    fi

}

install_tkn_for_mac() {

    wget https://github.com/tektoncd/cli/releases/download/v0.24.0/tkn_0.24.0_Darwin_all.tar.gz -P /usr/local/bin
    tar -xvzf /usr/local/bin/tkn_0.24.0_Darwin_all.tar.gz -C /usr/local/bin/
    
    if [[ -a /usr/local/bin/tkn ]]; then 
        chmod +x /usr/local/bin/tkn
        echo "alias tkn='/usr/local/bin/tkn" >> ~/.zshrc
    else
        brew install tektoncd-cli
    fi

}