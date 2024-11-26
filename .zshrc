# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.config/.oh-my-zsh"
export LANG=en_US.UTF-8
export UPDATE_ZSH_DAYS=7
export LC_CTYPE="en_US.UTF-8"
export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/go/bin:$PATH"

export BROWSER="brave"
export EDITOR="nvim"

HISTFILE=$HOME/.cache/zsh/history
ZSH_THEME="agnoster"

[ ! -f $HISTFILE ] && mkdir -p $(dirname $HISTFILE) && touch $HISTFILE

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"
plugins=(git dotenv docker kubectl)

# allow those plugins only when running X11
[[ -n $DISPLAY ]] && plugins=("$plugins" zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# pacman -S zsh-syntax-higlighting
ZSH_SYN_HIGH=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$ZSH_SYN_HIGH" ] && source "$ZSH_SYN_HIGH" 2> /dev/null

# alias kubectl="sudo kubectl"
# alias kubectl="minikube kubectl --"
alias docker="sudo docker"
alias vim="nvim"
alias dotfiles="git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"
alias neofetch="fastfetch"

bq

which fzf > /dev/null && source <(fzf --zsh)
