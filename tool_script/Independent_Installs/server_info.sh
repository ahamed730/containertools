server_info(){

    DISTRO=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om || echo "")
    ARCHITECTURE=$(uname -m)
    BITS=$(getconf LONG_BIT)
    
    }