#!/bin/bash

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply txus
