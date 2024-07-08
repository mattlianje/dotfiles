#!/bin/bash
#
# -----------------------------------------------------------------------
# [Author: Matthieu Court]
# [E-mail: matthieu.court@protonmail.com]
#
#         Personal UNIX-like setup for Debian machines
# -----------------------------------------------------------------------

export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export PINK='\033[1;35m'
export RED='\033[0;31m'
export NC='\033[0m'

update_system() {
    echo -e "${BLUE}***** Updating the system *****${NC}"
    sudo apt-get update -y || {
        echo -e "${RED}Failed to update the system${NC}"
        exit 1
    }
}

install_packages() {
    local packages=(
        brightnessctl
        cmus
        compton
        dunst
        feh
        git
        i3blocks
        kitty
        mpv
        ncspot
        neovim
        polybar
        pip3
        python3
        rofi
        vim
        vifm
        zathura
        zsh
    )

    for package in "${packages[@]}"; do
        echo -e "${GREEN}***** Installing: ${package} *****${NC}"
        sudo apt-get install -y "$package" || {
            echo -e "${RED}Failed to install $package${NC}"
            exit 1
        }
    done
}

install_python_packages() {
    local python_packages=(
        pywal
    )

    for package in "${python_packages[@]}"; do
        echo -e "${GREEN}***** Installing pip packages: ${package} *****${NC}"
        pip3 install "$package" || {
            echo -e "${RED}Failed to install pip package $package${NC}"
            exit 1
        }
    done
}

install_rust_cargo() {
    echo -e "${GREEN}***** Installing Rust and Cargo *****${NC}"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh || {
        echo -e "${RED}Failed to install Rust${NC}"
        exit 1
    }
    source "$HOME/.cargo/env"
}

install_i3() {
    echo -e "${YELLOW}***** Installing i3 *****${NC}"
    curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add - || {
        echo -e "${RED}Failed to add i3 key${NC}"
        exit 1
    }
    sudo apt install apt-transport-https --yes || {
        echo -e "${RED}Failed to install apt-transport-https${NC}"
        exit 1
    }

    echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" \
        | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
    sudo apt update || {
        echo -e "${RED}Failed to update repositories after adding i3${NC}"
        exit 1
    }
    sudo apt install i3 || {
        echo -e "${RED}Failed to install i3${NC}"
        exit 1
    }
}

main() {
    update_system
    install_packages
    install_python_packages
    install_rust_cargo
    install_i3

    echo -e "${GREEN}***** Rebooting *****${NC}"
    sudo reboot
}

main "$@"
