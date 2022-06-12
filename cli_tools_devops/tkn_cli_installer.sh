install_tkn_for_rpm() {

    sudo rpm -Uvh -f --reinstall https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-64bit.rpm || rpm -Uvh -f --reinstall https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-64bit.rpm || \ 
    if [[ -z "$(which tkn)" ]]; then
        sudo dnf copr enable chmouel/tektoncd-cli && sudo dnf install tektoncd-cli || dnf copr enable chmouel/tektoncd-cli && dnf install tektoncd-cli 
    fi
}

install_tkn_for_rpm_arm() {

    sudo rpm -Uvh -f --reinstall https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-ARM64.rpm || rpm -Uvh -f https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-ARM64.rpm
    if [[ -z "$(which tkn)" ]]; then
        sudo dnf copr enable chmouel/tektoncd-cli && sudo dnf install tektoncd-cli || dnf copr enable chmouel/tektoncd-cli && dnf install tektoncd-cli 
    fi
}


install_tkn_for_deb() {
    
    sudo apt update || apt update
    sudo apt install -y gnupg || apt install -y gnupg
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA || apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
    echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list || echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
    sudo apt update && sudo apt install -y tektoncd-cli || apt update && apt install -y tektoncd-cli || \
    sudo curl -L "https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-64bit.deb" -o /usr/local/bin/tektoncd-cli-0.24.0_Linux-64bit.deb && sudo dpkg -i /usr/local/bin/tektoncd-cli-0.24.0_Linux-64bit.deb && sudo chmod +x /usr/local/bin/tkn || \
    curl -L "https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-64bit.deb" -o /usr/local/bin/tektoncd-cli-0.24.0_Linux-64bit.deb && dpkg -i /usr/local/bin/tektoncd-cli-0.24.0_Linux-64bit.deb && chmod +x /usr/local/bin/tkn
    if [[ -a  /usr/local/bin/tkn ]]; then
        sudo chmod +x /usr/local/bin/tkn || chmod +x /usr/local/bin/tkn
        sudo echo "alias tkn='/usr/local/bin/tkn" >> ~/.bashrc || echo "alias tkn='/usr/local/bin/tkn" >> ~/.bashrc 
        sudo source /usr/local/bin/tkn || source /usr/local/bin/tkn
    fi
}

install_tkn_for_deb_arm() {

    sudo apt update || apt update
    sudo apt install -y gnupg || apt install -y gnupg
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA || apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
    echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list || echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
    sudo apt update && sudo apt install -y tektoncd-cli || apt update && apt install -y tektoncd-cli || \
    sudo curl -L "https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-ARM64.deb" -o /usr/local/bin/tektoncd-cli-0.24.0_Linux-ARM64.deb && sudo dpkg -i /usr/local/bin/tektoncd-cli-0.24.0_Linux-ARM64bit.deb || \
    curl -L "https://github.com/tektoncd/cli/releases/download/v0.24.0/tektoncd-cli-0.24.0_Linux-ARM64.deb" -o /usr/local/bin/tektoncd-cli-0.24.0_Linux-ARM64.deb && dpkg -i /usr/local/bin/tektoncd-cli-0.24.0_Linux-ARM64bit.deb 
    if [[ -a  /usr/local/bin/tkn ]]; then
        sudo chmod +x /usr/local/bin/tkn || chmod +x /usr/local/bin/tkn
        sudo echo "alias tkn='/usr/local/bin/tkn" >> ~/.bashrc || echo "alias tkn='/usr/local/bin/tkn" >> ~/.bashrc 
        sudo source /usr/local/bin/tkn || source /usr/local/bin/tkn
    fi

}

install_tkn_for_mac() {

    sudo wget https://github.com/tektoncd/cli/releases/download/v0.24.0/tkn_0.24.0_Darwin_all.tar.gz -P /usr/local/bin || wget https://github.com/tektoncd/cli/releases/download/v0.24.0/tkn_0.24.0_Darwin_all.tar.gz -P /usr/local/bin
    sudo tar -xvzf /usr/local/bin/tkn_0.24.0_Darwin_all.tar.gz -C /usr/local/bin/  || tar -xvzf /usr/local/bin/tkn_0.24.0_Darwin_all.tar.gz -C /usr/local/bin/
    if [[ -a /usr/local/bin/tkn ]]; then 
        sudo chmod +x /usr/local/bin/tkn || chmod +x /usr/local/bin/tkn
    else
        sudo brew install tektoncd-cli || brew install tektoncd-cli
    fi

}