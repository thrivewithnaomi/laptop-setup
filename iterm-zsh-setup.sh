#!/bin/bash

# Set up iTerm, Zsh, and Oh My Zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install iTerm2
brew cask install iterm2

# Test if we are using ZSH and the correct ZSH 
# echo $0 # Works only if you are executing directly in shell
# Output should be: zsh
which zsh
# Output should be: /usr/local/bin/zsh

# Install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Add Syntax Highlighting Plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add ZSH-AutoSuggestion Plugin
git clone https://github.com/zsh-users/zsh-autosuggestions  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Enable shell integration
curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash

# Add Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Copy .zshrc file to home directory and refresh shell
cp ~/gitRepos/laptop-setup/zsh/.zshrc ~/.zshrc
source ~/.zshrc

# Remove "last login" message from new terminal tabs
touch ~/.hushlogin