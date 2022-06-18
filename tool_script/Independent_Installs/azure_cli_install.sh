install_azure_for_mac() {

brew update && brew install azure-cli

}

install_azure_for_deb() {

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

if [[ -z "$(which az)" ]]; then
    apt-get update
    apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
    apt-get update
    apt-get install azure-cli
fi

mv $(which az) /usr/local/bin/az

if [[ -a /usr/local/bin/az ]]; then
    chmod +x /usr/local/bin/az
    echo "alias az='/usr/local/bin/az'" >> ~/.bashrc
else
    echo "/usr/local/bin/az not found"
fi

}


install_azure_for_rpm(){

rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
sudo dnf install -y azure-cli
mv $(which az) /usr/local/bin/az
if [[ -a /usr/local/bin/az ]]; then
    chmod +x /usr/local/bin/az
    echo "alias az='/usr/local/bin/az'" >> ~/.bashrc
else
    echo "/usr/local/bin/az not found"
fi

}