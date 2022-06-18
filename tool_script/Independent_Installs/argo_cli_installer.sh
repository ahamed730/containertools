install_argo_linux() {
    
    curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 
    
    if [[ -a /usr/local/bin/argocd ]]; then
        chmod +x /usr/local/bin/argocd
        echo "alias argocd='/usr/local/bin/argocd'" >> ~/.bashrc
    else
        echo "/usr/local/bin/argocd not found"
    fi

} 

install_argo_macos() {
    
    curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-darwin-amd64
    
    if [[ -a /usr/local/bin/argocd ]]; then
        chmod +x /usr/local/bin/argocd
        echo "alias argocd='/usr/local/bin/argocd'" >> ~/.zshrc
    else
        echo "/usr/local/bin/argocd not found"
    fi

    if [[ -z "$(which argocd)" ]]; then
        brew install argocd
    fi

} 