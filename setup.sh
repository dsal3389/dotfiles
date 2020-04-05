#! /bin/bash


YAY="https://aur.archlinux.org/yay.git"
DOTFILES=$HOME/dotfiles # installed dotfiles
BASE_PACKEGES=(
	i3
	picom
	feh
	kitty
	zsh
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
}


ask "install fonts?" && sudo pacman -S --needed --noconfirm -cc $(pacman -Ssq noto-)
ask "install base packeges?" && sudo pacman -S --needed --noconfirm -cc $BASE_PACKEGES
ask "install yay (AUR packege helper)?" && install_yay

chsh -s /bin/bash $(whoami)
ask "would u like to proseed now with OH-MY-ZSH?" && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp -rf "${DOTFILES}/.config/*" "${HOME}/.config"
cp -rf "${DOTFILES}/*" "${HOME}"


