#! env zsh
#
apt install git curl
#Install Vim plugins
if [[ ! -f ~/.vimrc ]]; then
	# Install default set of plugins and vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp vimrc ~/.vimrc
	pip3 install rope ropevim
	vim -c PluginInstall -c ":qall"
	# install rope
fi

# Install Prezto
if [[ ! -f ~/.zshrc ]]; then
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	setopt EXTENDED_GLOB
	for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
		  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	  done
fi

#install Tmux
if [[ ! -f ~/.tmux.conf ]]; then
	cp tmuxconf ~/.tmux.conf
fi

