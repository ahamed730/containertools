install_docker_mac(){

    if [[ -z "$(which docker)" ]]; then
        brew install --cask docker || brew reinstall --cask docker

    fi

}