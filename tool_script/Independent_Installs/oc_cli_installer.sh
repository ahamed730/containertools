install_oc_linux(){      

    wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -P /usr/local/bin
    tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin
    
    if [[ -a /usr/local/bin/oc ]]; then
        chmod +x /usr/local/bin/oc
        echo "alias oc='/usr/local/bin/oc'" >> ~/.bashrc
    else
        echo "/usr/local/bin/oc not found"
    fi

}


install_oc_mac(){

    wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-mac.tar.gz -P /usr/local/bin
    tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin 
    
    if [[ -a /usr/local/bin/oc ]]; then
        chmod +x /usr/local/bin/oc
        echo "alias oc='/usr/local/bin/oc'" >> ~/.zshrc 
    else
        echo "/usr/local/bin/oc not found"
    fi

    if [[ -z "$(which oc)" ]]; then
        brew install openshift-cli || brew upgrade openshift-cli
    fi

}

install_oc_mac_arm(){

    wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-mac-arm64.tar.gz -P /usr/local/bin
    tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin
    
    if [[ -a /usr/local/bin/oc ]]; then
        chmod +x /usr/local/bin/oc
        echo "alias oc='/usr/local/bin/oc'" >> ~/.zshrc
    else
        echo "/usr/local/bin/oc not found"
    fi

    if [[ -z "$(which oc)" ]]; then
        brew install openshift-cli || brew upgrade openshift-cli
    fi

}
