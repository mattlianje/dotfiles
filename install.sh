#!/bin/bash

# -----------------------------------------------------------------------
# [Author: Matthieu Court]
# [E-mail: matthieu.court@protonmail.com]
#
#         Personal UNIX-like setup for Darwin and Debian based machines.
# -----------------------------------------------------------------------

# List of packages to install
packages=(
    git
    vim
    curl
    fish
    fzf
    htop
    kubectl
    lolcat
    node
    postgresql
    pyenv
    pipenv
    jupyterlab
    ripgrep
    sbt
    scala
    stow
    tmux
    tree
    wget
    apache-spark
    apache-pulsar
    kafka
    lampepfl/brew/dotty
    haskell-stack
    openjdk@8
    openjdk@11
)

# List of casks to install (optional)
casks=(
    intellij-idea
    brave-browser
    datagrip
    docker
    iterm2
    rectangle
    sublime-text
    wireshark
    karabiner-elements
    slack
)

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PINK='\033[1;35m'
NC='\033[0m' # No Color

# Check the operating system and install packages
if [[ $(uname) == "Darwin" ]]; then

    echo -e "${PINK}Installing Homebrew and ohmyzsh on macOS ...${NC}"
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo -e "${PINK}Installing Powerline fonts on macOS ...${NC}"
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    echo -e "${GREEN}Installing packages on macOS...${NC}"
    brew update
    total_pkgs=${#packages[@]}
    curr_pkg=0
    for pkg in "${packages[@]}"; do
        curr_pkg=$((curr_pkg + 1))
        echo -e "${PINK}[$curr_pkg/$total_pkgs] Installing $pkg...${NC}"
        brew install $pkg
    done

    echo -e "${PINK}Installing Python on macOS in a nice way...${NC}"
    pyenv install $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
    pyenv global $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)

    if [[ ${#casks[@]} -ne 0 ]]; then
        echo -e "${GREEN}Installing casks on macOS...${NC}"
        total_casks=${#casks[@]}
        curr_cask=0
        for cask in "${casks[@]}"; do
            curr_cask=$((curr_cask + 1))
            echo -e "${PINK}[$curr_cask/$total_casks] Installing $cask...${NC}"
            brew install --cask $cask
        done
    fi
elif [[ $(uname) == "Linux" ]]; then
    echo -e "${GREEN}Installing packages on Ubuntu...${NC}"
    sudo apt-get update
    total_pkgs=${#packages[@]}
    curr_pkg=0
    for pkg in "${packages[@]}"; do
        curr_pkg=$((curr_pkg + 1))
        echo -e "${BLUE}[$curr_pkg/$total_pkgs] Installing $pkg...${NC}"
        sudo apt-get install -y $pkg
    done
    echo -e "${BLUE}Installing Python in a less than nice way...${NC}"
    sudo apt-get install -y python3
else
    echo -e "${YELLOW}Unsupported operating system.${NC}"
    exit 1
fi

# Print installation complete message
echo -e "${GREEN}Installation complete!${NC}"
