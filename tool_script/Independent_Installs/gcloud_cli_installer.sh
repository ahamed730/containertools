#! /bin/bash

install_gcloud_for_x86() {

    curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-linux-x86_64.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-linux-x86_64.tar.gz
    tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-linux-x86_64.tar.gz -C /usr/local/bin
    /usr/local/bin/google-cloud-sdk/install.sh -q 
    
    if [[ -a /usr/local/bin/google-cloud-sdk/bin/gcloud ]]; then
        chmod +x /usr/local/bin/google-cloud-sdk/bin/gcloud
        echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.bashrc 
    else
        echo "/usr/local/bin/google-cloud-sdk/bin/gcloud not found"
    fi
}

install_gcloud_for_arm() {

    curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-linux-arm.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-linux-arm.tar.gz
    tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-linux-arm.tar.gz -C /usr/local/bin 
    /usr/local/bin/google-cloud-sdk/install.sh -q
    
    if [[ -a /usr/local/bin/google-cloud-sdk/bin/gcloud ]]; then
        chmod +x /usr/local/bin/google-cloud-sdk/bin/gcloud
        echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.bashrc 
    else
        echo "/usr/local/bin/google-cloud-sdk/bin/gcloud not found"
    fi

}

install_gcloud_for_mac_x86() {

   curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz
   tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz -C /usr/local/bin
   /usr/local/bin/google-cloud-sdk/install.sh -q
    
    if [[ -a /usr/local/bin/google-cloud-sdk/bin/gcloud ]]; then
        chmod +x /usr/local/bin/google-cloud-sdk/bin/gcloud
        echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc 
    else
        echo "/usr/local/bin/google-cloud-sdk/bin/gcloud not found"
    fi
}

install_gcloud_for_mac_m1() {

   curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-darwin-arm.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-darwin-arm.tar.gz 
   tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-darwin-arm.tar.gz -C /usr/local/bin 
   /usr/local/bin/google-cloud-sdk/install.sh -q 
    
    if [[ -a /usr/local/bin/google-cloud-sdk/bin/gcloud ]]; then
        chmod +x /usr/local/bin/google-cloud-sdk/bin/gcloud
        echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.bashrc 
    else
        echo "/usr/local/bin/google-cloud-sdk/bin/gcloud not found"
    fi

}