install_gh_for_rpm() {

dnf install -yq 'dnf-command(config-manager)'
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf -yq install gh
mv $(which gh) /usr/local/bin/gh
if [[ -a /usr/local/bin/gh ]]; then
    chmod +x /usr/local/bin/gh
    echo "alias gh='/usr/local/bin/gh'" >> ~/.bashrc
else
    echo "/usr/local/bin/gh not found"
fi

}



install_gh_for_deb() {
    
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update
apt install -y gh
mv $(which gh) /usr/local/bin/gh
if [[ -a /usr/local/bin/gh ]]; then
    chmod +x /usr/local/bin/gh
    echo "alias gh='/usr/local/bin/gh'" >> ~/.bashrc
else
    echo "/usr/local/bin/gh not found"
fi

}


install_gh_for_mac() {
    
brew install gh || brew upgrade gh

}