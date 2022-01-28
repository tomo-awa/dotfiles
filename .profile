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
eval "$($HOME/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_BUNDLE_FILE=~/.Brewfile

export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_CA_CERTIFICATES=1

# uiwsgi用？
# export LDFLAGS="-L$HOME/.linuxbrew/opt/openssl@1.1/lib  -L$HOME/.linuxbrew/opt/libffi/lib"
# export LDFLAGS="-L$HOME/.linuxbrew/opt/openssl@1.1/lib  -L$HOME/.linuxbrew/opt/libffi/lib -L$HOME/.linuxbrew/opt/util-linux/lib"
# export CPPFLAGS="-I$HOME/.linuxbrew/opt/openssl@1.1/include  -I$HOME/.linuxbrew/opt/libffi/include"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.linuxbrew/lib"
export C_INCLUDE_PATH="$C_INCLUDE_PATH:$HOME/.linuxbrew/include"

# anyenv
if [[ $SHELL == `which zsh` ]] ; then
    # zsh
    eval "$(anyenv init - zsh)"
else
    # bash
    eval "$(anyenv init -)"
fi
