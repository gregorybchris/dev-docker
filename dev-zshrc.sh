# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #
#  ~ ~ ~ ~ Antigen Setup ~ ~ ~ ~ #
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #

source /home/chris/.antigen.zsh
antigen use oh-my-zsh

antigen bundle autojump
antigen bundle command-not-found
antigen bundle git
antigen bundle pip
antigen bundle npm

antigen bundle djui/alias-tips
antigen bundle supercrabtree/k
antigen bundle zsh-users/zsh-completions

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell
antigen apply

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #
#  ~ ~ ~ ~ Installations ~ ~ ~ ~ #
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #

# Vim
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=vim
    export VISUAL=vim
else
    export EDITOR='mvim'
    export VISUAL=vim
fi

# Miniconda
export PATH=/home/chris/miniconda3/bin:$PATH

# Haskell
source /home/chris/.ghcup/env

# Go
export GOROOT=/home/chris/go
export PATH=$GOROOT/bin:$PATH

# Homebrew
# export PATH=/home/chris/.linuxbrew/bin:$PATH

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #
#  ~ ~ ~ ~ Aliases ~ ~ ~ ~ #
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #

# Zsh
alias edit="vim ~/.zshrc"
alias zource="source ~/.zshrc"

# Python
alias delpyc="find . -name \*.pyc -delete"

# Weather
alias wttr="curl 'wttr.in/Seattle?F5'"
