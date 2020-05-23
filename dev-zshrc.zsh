# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #
#  ~ ~ ~ ~ Zsh ~ ~ ~ ~ #
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #

source $HOME/.antigen.zsh
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
    export EDITOR=mvim
    export VISUAL=vim
fi

# Miniconda
export PATH=$HOME/miniconda3/bin:$PATH

# Haskell
source $HOME/.ghcup/env

# Go
export GOROOT=$HOME/go
export PATH=$GOROOT/bin:$PATH

# Rust
source $HOME/.cargo/env

# Homebrew
# export PATH=$HOME/.linuxbrew/bin:$PATH

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #
#  ~ ~ ~ ~ Aliases ~ ~ ~ ~ #
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  #

# Zsh
alias edit="vim ~/.zshrc"
alias zource="source ~/.zshrc"

# Weather
alias wttr="curl 'wttr.in/Seattle?F5'"
