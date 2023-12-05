#!/bin/bash

# -----------------------------------------------------------------------
# [Author: Matthieu Court]
# [E-mail: matthieu.court@protonmail.com]
#
#         Personal UNIX-like setup for macOS machines
# -----------------------------------------------------------------------

source colours.sh

packages=(
    apache-pulsar
    apache-spark
    curl
    fish
    fzf
    git
    haskell-stack
    htop
    jupyterlab
    kafka
    kubectl
    lampepfl/brew/dotty
    lolcat
    node
    openjdk@11
    openjdk@8
    pipenv
    postgresql
    pyenv
    ripgrep
    sbt
    scala
    stow
    tmux
    tree
    vim
    wget
)

casks=(
    brave-browser
    docker
    intellij-idea
    iterm2
    slack
    wireshark
)

install_homebrew() {
    echo -e "${PINK}Installing Homebrew and ohmyzsh on macOS ...${NC}"
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_powerline_fonts() {
    echo -e "${PINK}Installing Powerline fonts on macOS ...${NC}"
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts || exit
    ./install.sh
    cd .. || exit
    rm -rf fonts
}

install_packages() {
    echo -e "${GREEN}Installing packages on macOS...${NC}"
    brew update
    for pkg in "${packages[@]}"; do
        echo -e "${PINK}Installing $pkg...${NC}"
        brew install "$pkg"
    done
}

install_casks() {
    if [[ ${#casks[@]} -ne 0 ]]; then
        echo -e "${GREEN}Installing casks on macOS...${NC}"
        for cask in "${casks[@]}"; do
            echo -e "${PINK}Installing $cask...${NC}"
            brew install --cask "$cask"
        done
    fi
}

install_latest_python() {
    echo -e "${PINK}Installing Python on macOS in a nice way...${NC}"
    local latest_python_version
    latest_python_version=$(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
    pyenv install "$latest_python_version"
    pyenv global "$latest_python_version"
}

main() {
    install_homebrew
    install_powerline_fonts
    install_packages
    install_casks
    install_latest_python

    echo -e "${GREEN}Installation complete!${NC}"
}

main "$@"
