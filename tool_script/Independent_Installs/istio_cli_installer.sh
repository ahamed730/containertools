install_istio_linux() {

curl -sL https://istio.io/downloadIstioctl | sh -
export PATH=$PATH:$HOME/.istioctl/bin
mv $(which istioctl) /usr/local/bin/istioctl

if [[ -a /usr/local/bin/istioctl ]]; then
    chmod +x /usr/local/bin/istioctl
    echo "alias istioctl='/usr/local/bin/istioctl" >> ~/.bashrc
else
    echo "/usr/local/bin/istioctl not found"
fi

}

install_istio_mac() {

curl -sL https://istio.io/downloadIstioctl | sh -
export PATH=$PATH:$HOME/.istioctl/bin
mv $(which istioctl) /usr/local/bin/istioctl

if [[ -a /usr/local/bin/istioctl ]]; then
    chmod +x /usr/local/bin/istioctl
    echo "alias istioctl='/usr/local/bin/istioctl" >> ~/.zshrc
else
    echo "/usr/local/bin/istioctl not found"
fi

}