# .bash_profile
if [ -f ~/.bash_profile.local ]; then
    . ~/.bash_profile.local
fi

if [ -f ~/.profile ]; then
    . ~/.profile
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
