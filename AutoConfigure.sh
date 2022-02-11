#!/bin/bash

# Define Colors
NOCOLOR='\033[0m'
BLACK='\033[30m'
WHITE='\033[1;37m'
RED='\033[0;31m'
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
LIGHTGREEN='\033[1;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHTBLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHTPURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHTCYAN='\033[1;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'

# Going to user home directory
cd $HOME

# Download oh-my-zsh from GitHub
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "${GREEN}oh-my-zsh installed sucessfuly, please change your default shell to ${LIGHTRED}zsh${NOCOLOR}"

# Config oh-my-zsh theme to p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo -e "${BLUE}To use all features it's better to install MesloLGS NF fonts from --> ${LIGHTRED}'https://github.com/romkatv/powerlevel10k#fonts' ${BLUE}and setup to your terminal application from settings.${NOCOLOR}"

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting virtualenvwrapper kubectl history emoji encode64 sudo web-search copydir copyfile copybuffer dirhistory jsontools)/g' $HOME/.zshrc

# Install SpaceVim 
curl -sLf https://spacevim.org/install.sh | bash

# Deactive relative line number in SpaceVim
sed -i '25 a \\ \ \ \ relativenumber = false' $HOME/.SpaceVim.d/init.toml
