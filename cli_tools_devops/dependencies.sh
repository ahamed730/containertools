#! /bin/bash

install_deps_with_apt() {

    sudo apt-get update -y || apt-get update 
    sudo apt-get install -y apt-utils || apt-get install -y apt-utils
    sudo apt-get -y upgrade || apt-get -y upgrade
    sudo apt-get install -y software-properties-common || apt-get install -y software-properties-common
    sudo apt-get -y install apt-transport-https || apt-get -y install apt-transport-https
    sudo apt-get -y install wget || apt-get -y install wget
    sudo apt-get install -y curl || apt-get install -y curl   

}

install_deps_with_yum() {

    sudo yum update -y || yum update -y
    sudo yum install -y wget || yum install -y wget
    sudo yum install -y curl || yum install -y curl
    sudo yum install epel-release -y || yum install epel-release -y

}
