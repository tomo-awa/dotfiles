# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -f ~/.profile.local ]; then
    . ~/.profile.local
fi

# locale
export LANG="ja_JP.UTF-8"
export LANGUAGE="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"
export LC_TIME="ja_JP.UTF-8"

# homebrew
BREW_DIR="/home/linuxbrew"
if [ -d "$HOME/.linuxbrew" ]; then
    BREW_DIR="$HOME"
fi

eval "$($BREW_DIR/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_BUNDLE_FILE=~/.Brewfile

export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_CA_CERTIFICATES=1

# uiwsgi用？
# export LDFLAGS="-L$BREW_DIR/.linuxbrew/opt/openssl@1.1/lib  -L$BREW_DIR/.linuxbrew/opt/libffi/lib"
# export LDFLAGS="-L$BREW_DIR/.linuxbrew/opt/openssl@1.1/lib  -L$BREW_DIR/.linuxbrew/opt/libffi/lib -L$BREW_DIR/.linuxbrew/opt/util-linux/lib"
# export CPPFLAGS="-I$BREW_DIR/.linuxbrew/opt/openssl@1.1/include  -I$BREW_DIR/.linuxbrew/opt/libffi/include"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$BREW_DIR/.linuxbrew/lib"
export C_INCLUDE_PATH="$C_INCLUDE_PATH:$BREW_DIR/.linuxbrew/include"

# anyenv
if [[ $SHELL == `which zsh` ]] ; then
    # zsh
    eval "$(anyenv init - zsh)"
else
    # bash
    eval "$(anyenv init -)"
fi
