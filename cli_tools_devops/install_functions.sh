#! /bin/bash
source server_info.sh
source dependencies.sh 
source ibmc_cli_installer.sh
source aws_cli_installer.sh
source gcloud_cli_installer.sh
source tkn_cli_installer.sh
source argo_cli_installer.sh
source oc_cli_installer.sh

server_info


# Linux Pre-requisites

if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* ]]; then
    install_deps_with_apt

elif [[ "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]]; then
    install_deps_with_yum

else
    install_deps_with_apt || install_deps_with_yum

fi

# IBM CLOUD CLI

if [[ ${IBMCLOUD_CLI} == true ]]; then
   install_ibmc
fi


#AWS CLI
if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* || "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${AWS_CLI} == true ]] && [[ ${ARCHITECTURE} == x86_64 ]]; then
    install_aws_for_x86

elif [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* || "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${AWS_CLI} == true ]] && [[ ${ARCHITECTURE} == arm64 || ${ARCHITECTURE} == Arm64  ]]; then
    install_aws_for_arm

elif [[ ${AWS_CLI} == true ]]; then
    install_aws_for_mac

fi


#GCLOUD CLI
if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* || "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${GCLOUD_CLI} == true ]] && [[ ${ARCHITECTURE} == x86_64 ]]; then
    install_gcloud_for_x86

elif [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* || "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${GCLOUD_CLI} == true ]] && [[ ${ARCHITECTURE} == arm64 || ${ARCHITECTURE} == Arm64  ]]; then
    install_gcloud_for_arm

elif [[ ${ARCHITECTURE} == x86_64 ]] && [[ ${GCLOUD_CLI} == true ]]; then
    install_gcloud_for_mac_x86

else
    install_gcloud_for_mac_m1

fi

#Tekton CLI
if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* ]] && [[ ${TKN_CLI} == true ]] && [[ ${ARCHITECTURE} == x86_64 ]]; then
    install_tkn_for_deb
elif [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* ]] && [[ ${TKN_CLI} == true ]] && [[ ${ARCHITECTURE} == Arm64 || ${ARCHITECTURE} == arm64 ]]; then
    install_tkn_for_deb_arm
elif [[ "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${TKN_CLI} == true ]] && [[ ${ARCHITECTURE} == x86_64 ]]; then
    install_tkn_for_rpm
elif [[ "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${TKN_CLI} == true ]] && [[ ${ARCHITECTURE} == Arm64 || ${ARCHITECTURE} == arm64 ]]; then
    install_tkn_for_rpm_arm
elif [[ ${TKN_CLI} == true ]]; then
    install_tkn_for_mac
fi


#ARGO CD CLI
if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* || "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${ARGO_CD_CLI} == true ]]; then
    install_argo_linux
elif [[ ${ARGO_CD_CLI} == true ]]; then
    install_argo_macos
fi



#OC CLI
if [[ "$DISTRO" == *Ubuntu* || "$DISTRO" == *Debian* || "$DISTRO" == *RED*HAT* || "$DISTRO" == *RHEL* || "$DISTRO" == *CentOS* || "$DISTRO" == Fedora  || "$DISTRO" == *Red*Hat*Enterprise*Linux* ]] && [[ ${OC_CLI} == true ]]; then
    install_oc_linux
elif [[ ${OC_CLI} == true ]] && [[ ${ARCHITECTURE} == arm64 || ${ARCHITECTURE} == Arm64 ]]; then
    install_oc_mac_arm
elif [[ $OC_CLI == true ]]; then
    install_oc_mac
fi