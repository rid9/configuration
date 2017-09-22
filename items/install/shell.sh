# Install ZSH with the configuration used by the Arch live CD.
install zsh grml-zsh-config

# Change the user shell to the installed ZSH.
run chsh -s /usr/bin/zsh $USER
