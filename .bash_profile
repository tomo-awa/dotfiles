# .bash_profile
if [ -f ~/.profile ]; then
    . ~/.profile
fi

if [ -f ~/.bash_profile.local ]; then
    . ~/.bash_profile.local
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
