#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
source "$HOME/.cargo/env"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply txus
