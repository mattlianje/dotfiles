#!/bin/bash

# ------------------------------------------------------------------
# [Author: Matthieu Court]
# [E-mail: matthieu.court@protonmail.com]
#
#         Personal UNIX-like setup for Darwin and Debian based machines.
#         Script to symlink personal dotfiles using GNU stow.
# ------------------------------------------------------------------

source echocolours

echo "Creating ~/.dotfiles directory"
mkdir ~/.dotfiles
rm -r ~/.dotfiles/*
cp -r dotfiles/* ~/.dotfiles
cd ~/.dotfiles

DOTFILES=(
    vim
    git
    zsh
    tmux
)

# Prompting sudo password
sudo echo "Password prompted!"

# Installation process
for FILE in ${DOTFILES[@]}
do
  echo
  log_info "Symlinking ${BOLD}${FILE}${NORMAL}..."
  stow "${FILE}"
  if [ $? -eq 0 ]; then
    log_success "${FILE} successfully symlinked to ${HOME}/${FILE}"
  else
    log_error "Failed to symlink ${FILE} to ${HOME}/${FILE}"
  fi
done


