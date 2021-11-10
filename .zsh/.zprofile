if [ -f ${ZDOTDIR}/.zprofile.local ]; then
    . ${ZDOTDIR}/.zprofile.local
fi

if [ -f ${ZDOTDIR}/.zshrc ]; then
    . ${ZDOTDIR}/.zshrc
fi
