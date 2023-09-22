#!/bin/bash

echo 'Installing rust...'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
source "$HOME/.cargo/env"

echo 'Installing LunarVim...'
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

echo 'Installing TPM...'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'Installing Chezmoi...'
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply txus
