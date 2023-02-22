#!/bin/bash

# ------------------------------------------------------------------
# [Author: Matthieu Court]
# [E-mail: matthieu.court@protonmail.com]
#
#         Personal UNIX-like setup for Darwin and Debian based machines.
#         Script to unlink personal dotfiles using GNU stow.
# ------------------------------------------------------------------

# Colors for output
GREEN='\033[0;32m'
PINK='\033[1;35m'
NC='\033[0m' # No Color

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
  log_info "Unlinking ${PINK}${FILE}${NC}..."
  stow -D "${FILE}"
  if [ $? -eq 0 ]; then
    log_success "${FILE} successfully unlinked from ${HOME}/${FILE}"
  else
    log_error "Failed to unlink ${FILE} from ${HOME}/${FILE}"
  fi
done



