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
