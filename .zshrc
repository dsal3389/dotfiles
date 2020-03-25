export ZSH="/home/dsal3389_/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"

HISTFILE=$HOME/.cache/zsh/history

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"


export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

ENABLE_CORRECTION="true"
ZSH_THEME="nebirhos"

#################
#     alias     #
#################
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

[[ -n $DISPLAY ]] && plugins=("$plugins[@]" zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


export PATH=$HOME/.local/bin:$PATH
export EDITOR='vim'

ZSH_SYN_HIGH=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pacman -S zsh-syntax-highlighting
[ -f "$ZSH_SYN_HIGH" ] && source "$ZSH_SYN_HIGH" 2> /dev/null


