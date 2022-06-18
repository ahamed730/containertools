#! /bin/bash
DISTRO=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om || echo "")
[ "$(id -u)" -ne 0 ] && SUDO=${SUDO} || SUDO=""
ARCHITECTURE=$(uname -m)
BITS=$(getconf LONG_BIT)


#IBM CLOUD CLI
# if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* ]] && [[ ${IBMCLOUD_CLI} == true ]]; then
#     ${SUDO} apt-get update -y && ${SUDO} apt-get install -y apt-utils
#     ${SUDO} apt-get -y upgrade 
#     ${SUDO} apt-get install -y software-properties-common 
#     ${SUDO} apt-get -y install apt-transport-https
#     ${SUDO} apt-get -y install wget
#     ${SUDO} apt-get install -y curl  
#     curl -sL https://raw.githubusercontent.com/IBM-Cloud/ibm-cloud-developer-tools/master/linux-installer/idt-installer | bash

# elif [[ "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${IBMCLOUD_CLI} == true ]]; then
#     ${SUDO} yum update -y
#     ${SUDO} yum install -y wget
#     ${SUDO} yum install -y curl
#     curl -sL https://raw.githubusercontent.com/IBM-Cloud/ibm-cloud-developer-tools/master/linux-installer/idt-installer | bash
#     ${SUDO} yum install epel-release -y
# ## MAC OS
# elif [[ ${IBMCLOUD_CLI} == true ]]; then
#     curl -sL https://raw.githubusercontent.com/IBM-Cloud/ibm-cloud-developer-tools/master/linux-installer/idt-installer | bash

# fi

#AWS CLI
# if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* || "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${AWS_CLI} == true ]]; then
#     curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#     unzip awscliv2.zip
#     ${SUDO} ./aws/install || ${SUDO} ./aws/install --update 
# ## MAC OS
# elif [[ ${AWS_CLI} == true ]]; then
#     curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
#     ${SUDO} installer -pkg AWSCLIV2.pkg -target /
# fi
# #GCLOUD CLI
if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* ]] && [[ ${GCLOUD_CLI} == true ]]; then
    ${SUDO} apt-get install apt-transport-https ca-certificates gnupg
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | ${SUDO} tee -a /etc/apt/sources.list.d/google-cloud-sdk.list || echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | ${SUDO} tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | ${SUDO} apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - || curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | ${SUDO} apt-key add - || curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | ${SUDO} tee /usr/share/keyrings/cloud.google.gpg
    ${SUDO} apt-get update && ${SUDO} apt-get install google-cloud-cli
elif [[ "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${GCLOUD_CLI} == true ]]; then
    ${SUDO} tee -a /etc/yum.repos.d/google-cloud-sdk.repo
    <<-EOM
    [google-cloud-cli]
    name=Google Cloud CLI
    baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
    enabled=1
    gpgcheck=1
    repo_gpgcheck=0
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
           https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM 
    ${SUDO} dnf install libxcrypt-compat.x86_64
    ${SUDO} dnf install google-cloud-cli
elif [[ ${GCLOUD_CLI} == true ]]; then
    cd ~ && curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-388.0.0-darwin-x86_64.tar.gz -o "google-cloud-cli.tar.gz"
    tar -xvf google-cloud-cli.tar.gz
    chmod +x ./google-cloud-sdk/install.sh && ./google-cloud-sdk/install.sh
fi