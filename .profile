# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# locale
export LANG="ja_JP.UTF-8"
export LANGUAGE="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"
export LC_TIME="ja_JP.UTF-8"

# homebrew
eval "$($HOME/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_BUNDLE_FILE=~/.Brewfile

export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_CA_CERTIFICATES=1

export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
export C_INCLUDE_PATH="$HOME/.linuxbrew/include:$C_INCLUDE_PATH"

# anyenv
if [[ $SHELL == `which zsh` ]] ; then
    # zsh
    eval "$(anyenv init - zsh)"
else
    # bash
    eval "$(anyenv init -)"
fi

if [ -f ~/.profile.local ]; then
    . ~/.profile.local
fi