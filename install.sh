#!/bin/bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
mkdir -p ~/.local/bin
mv nvim.appimage ~/.local/bin/nvim

echo 'Installing TPM...'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'Installing oh my zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'Installing Chezmoi...'
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply txus
