#! /bin/bash

install_deps_with_apt() {

    apt-get update -y 
    apt-get install -y apt-utils
    apt-get -y upgrade 
    apt-get install -y software-properties-common apt-transport-https wget curl 

}

install_deps_with_yum() {

    yum update -y
    yum install -y wget epel-release -y curl 

}

install_deps_mac() {
    
    if [[ -z "$(which brew)" && -n "$(which ruby)" ]]; then   
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

}
