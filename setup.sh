#! /bin/bash

OHMYZSH="https://github.com/ohmyzsh/ohmyzsh.git"
YAY="https://aur.archlinux.org/yay.git"
DOTFILES=$HOME/dotfiles # installed dotfiles
YAY_INSTALLED=`command -v yay`
BASE_PACKEGES=(
	xorg
	xorg-server
	xorg-xinit
	zsh
	i3
	feh
	kitty
	zsh
	dmenu
	vifm
	conky
)
AUR_PACKEGES=(
	compton-tryone-git
)
EXTRA_PACKEGES=(
	linux-headers
	virtualbox
	neofetch
)

# if not found the default path, the installed path is prob the currect dir
[ ! -f $DOTFILES ] && DOTFILES=`pwd` 

ask(){
	echo "${1}[Y/n]"
	read -p ">>> " ans 
	
	case "${ans}" in
		[Y/n]) return 1;;
		*) return 0;;
	esac
}

install_yay(){
	git clone "${YAY}"
	cd yay && makepkg -si
	cd .. && rm -rf yay	
	$YAY_INSTALLED=true
}


ask "install fonts?" && sudo pacman -S --noconfirm $(pacman -Ssq noto-)
sleep 1

ask "install base packeges?" && sudo pacman -S --noconfirm $BASE_PACKEGES
sleep 1

if [ ! $YAY_INSTALLED ];
then
	ask "install yay (AUR packege helper)?" && install_yay
fi

if [ $YAY_INSTALLED ];
then
	sleep 1
	ask "install AUR packeges?" && yay -S $AUR_PACKEGES
fi

mkdir ${HOME}/.config
ask "would u like to proseed now with OH-MY-ZSH?" && \
	rm -f ~/.config/.oh-my-zsh && git clone $OHMYZSH ~/.config/.oh-my-zsh

[ ! -d "${HOME}/.config" ] && mkdir "${HOME}/.config"
cp -rf $DOTFILES/.config/* "${HOME}/.config" 1> /dev/null
cp -rf $DOTFILES/* $HOME 1> /dev/null
cp -rf $DOTFILES/.* $HOME 1> /dev/null

chsh -s $(which zsh) $(whoami)

