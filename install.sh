#!/bin/bash

# ------------------------------------------------------------------#
# UNIX-like local-dev setup                                         #
# @author: Matthieu Court (matthieu.court@protonmail.com)           #
# ------------------------------------------------------------------#

# You can define what will be installed.

ACTIONS = (
    # --- Pre-installation tasks ---
    pre-install

    # --- Packages ---
    git
    curl
    wget
    python
    java8
    scala
    sbt
    r
    minikube
    vim
    lolcat
    node
    tmux
    k8
    htop
    wireshark

    # --- Casks ---
    docker
    chrome
    firefox
    slack
    iterm2
    virtualbox
    intellij-idea
    datagrip
)

source echocolours

echo "The following packages are going to be installed:"
printf "\033[1m  %s\n\033[0m" "${ACTIONS[@]}"
while true; do
    read -p "Do you want to continue? [Y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo -e "\nSkipping installation..."; exit;;
	* ) echo "Please provide correct answer";;
    esac
done

# Prompting sudo password
sudo echo "Password prompted!"

# Installation process
NOT_INSTALLED=()
for PACKAGE in ${ACTIONS[@]}
do
  echo
  log_info "Installing ${BOLD}${PACKAGE}${NORMAL}..."
  bash "${PACKAGE}.sh"
  if [ $? -eq 0 ]; then
    log_success "Package ${BOLD}${PACKAGE}${NORMAL} successfully installed"
  else
    log_error "Failed to install ${BOLD}${PACKAGE}${NORMAL}!"
    NOT_INSTALLED+=(${PACKAGE})
  fi
done

# Finishing
echo -e "\n${BOLD}$((${#ACTIONS[@]} - ${#NOT_INSTALLED[@]}))${NORMAL} of ${BOLD}${#ACTIONS[@]}${NORMAL} packages were successfully installed."
if [ ${#NOT_INSTALLED[@]} -ne 0 ]; then
  log_warning "Packages that were not installed:"
  printf "\033[1;31m  %s\n\033[0m" "${NOT_INSTALLED[@]}"
fi
echo "Installation finished."
