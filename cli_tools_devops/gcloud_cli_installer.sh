#! /bin/bash

install_gcloud_for_x86() {

    sudo curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-linux-x86_64.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-linux-x86_64.tar.gz || curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-linux-x86_64.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-linux-x86_64.tar.gz
    sudo tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-linux-x86_64.tar.gz -C /usr/local/bin || tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-linux-x86_64.tar.gz -C /usr/local/bin
    sudo /usr/local/bin/google-cloud-sdk/install.sh -q || /usr/local/bin/google-cloud-sdk/install.sh -q
    sudo echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc || echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc
    sudo source ~/.bashrc || source ~/.bashrc

}

install_gcloud_for_arm() {

    sudo curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-linux-arm.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-linux-arm.tar.gz || curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-linux-arm.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-linux-arm.tar.gz
    sudo tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-linux-arm.tar.gz -C /usr/local/bin || tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-linux-arm.tar.gz -C /usr/local/bin
    sudo /usr/local/bin/google-cloud-sdk/install.sh -q || /usr/local/bin/google-cloud-sdk/install.sh -q
    sudo echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc || echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc
    sudo source ~/.bashrc || source ~/.bashrc

}

install_gcloud_for_mac_x86() {

   sudo curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz || curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz 
   sudo tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz -C /usr/local/bin || tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz -C /usr/local/bin
   sudo /usr/local/bin/google-cloud-sdk/install.sh -q || /usr/local/bin/google-cloud-sdk/install.sh -q
   sudo echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc || echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc
   sudo source ~/.zshrc || source ~/.zshrc

}

install_gcloud_for_mac_m1() {

   sudo curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-darwin-arm.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-darwin-arm.tar.gz || curl "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-darwin-arm.tar.gz" -o /usr/local/bin/google-cloud-cli-388.0.0-darwin-arm.tar.gz
   sudo tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-darwin-arm.tar.gz -C /usr/local/bin || tar -xvf /usr/local/bin/google-cloud-cli-388.0.0-darwin-arm.tar.gz -C /usr/local/bin
   sudo /usr/local/bin/google-cloud-sdk/install.sh -q || /usr/local/bin/google-cloud-sdk/install.sh -q
   sudo echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc || echo "alias gcloud='/usr/local/bin/google-cloud-sdk/bin/gcloud'" >> ~/.zshrc
   sudo source ~/.zshrc || source ~/.zshrc

}