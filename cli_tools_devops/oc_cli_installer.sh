install_oc_linux(){      

    sudo wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -P /usr/local/bin || wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -P /usr/local/bin
    sudo tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin || tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin
    sudo chmod +x /usr/local/bin/oc  || chmod +x /usr/local/bin/oc 
    sudo echo "alias oc='/usr/local/bin/oc'" >> ~/.bashrc || echo "alias oc='/usr/local/bin/oc'" >> ~/.bashrc
    sudo source ~/.bashrc || source ~/.bashrc

}


install_oc_mac(){

    sudo wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-mac.tar.gz -P /usr/local/bin || https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-mac.tar.gz -P /usr/local/bin
    sudo tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin || tar xvf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin
    sudo chmod +x /usr/local/bin/oc || chmod +x /usr/local/bin/oc 
    sudo echo "alias oc='/usr/local/bin/oc'" >> ~/.zshrc || echo "alias oc='/usr/local/bin/oc'" >> ~/.zshrc
    sudo source ~/.zshrc || source ~/.zshrc
    if [[ -z "$(which oc)" ]]; then
        sudo brew install openshift-cli || sudo brew upgrade openshift-cli || brew install openshift-cli || brew upgrade openshift-cli
    fi

}

install_oc_mac_arm(){

    sudo wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-mac-arm64.tar.gz -P /usr/local/bin || wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-mac-arm64.tar.gz -P /usr/local/bin  &&
    sudo tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin || tar xvzf /usr/local/bin/openshift*.tar.gz -C /usr/local/bin
    sudo chmod +x /usr/local/bin/oc || chmod +x /usr/local/bin/oc
    sudo echo "alias oc='/usr/local/bin/oc'" >> ~/.zshrc || echo "alias oc='/usr/local/bin/oc'" >> ~/.zshrc
    sudo source ~/.zshrc || source ~/.zshrc
    if [[ -z "$(which oc)" ]]; then
        sudo brew install openshift-cli || sudo brew upgrade openshift-cli || brew install openshift-cli || brew upgrade openshift-cli
    fi

}
