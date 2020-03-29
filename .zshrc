export ZSH="${HOME}/.config/.oh-my-zsh"
export LANG=en_US.UTF-8
export UPDATE_ZSH_DAYS=7

ZSH_THEME="robbyrussell"

HISTFILE=$HOME/.cache/zsh/history


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

ENABLE_CORRECTION="true"
ZSH_THEME="nebirhos"

plugins=(git)

[[ -n $DISPLAY ]] && plugins=("$plugins[@]" zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export PATH=$HOME/.local/bin:$PATH
export EDITOR='vim'

ALIASES_FILE=$HOME/.config/zsh-aliases
[ -f "$ALIASES_FILE" ] && source  "$ALIASES_FILE"

# pacman -S zsh-syntax-highlighting
ZSH_SYN_HIGH=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$ZSH_SYN_HIGH" ] && source "$ZSH_SYN_HIGH" 2> /dev/null


