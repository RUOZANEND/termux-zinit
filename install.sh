#!/data/data/com.termux/files/usr/bin/bash

termirrors () {
    sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.bfsu.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
    yes y | pkg up >/dev/null
}

zshconf () {
    if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
        printf "Installing Zinit Plugin Manager (zdharma-continuum/zinit)…\n"
        command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
        command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" --depth=1 && \
            printf "Installation successful.\n" || \
            printf "The clone has failed.\n"
    fi

    cat $HOME/.termux/terinit/conf/.zshrc > $HOME/.zshrc
    cat $HOME/.termux/terinit/conf/.p10k.zsh > $HOME/.p10k.zsh
    if [ -e /data/data/com.termux/files/usr/bin/zsh ]; then
          chsh -s zsh
      else
          pkg i zsh -y
          chsh -s zsh
    fi
    echo "zsh install done"
}

terinit () {
    termirrors
    termirrors
    pkg i git subversion zsh fd fzf exa lua53 tar wget -y
    git clone https://github.com/rvvcim/terinit.git $HOME/.termux/terinit
    cp -r $HOME/.termux/terinit/termux/.* $HOME/.termux
    #:> $PREFIX/etc/motd
    zshconf
    termux-reload-settings
    zsh
    echo "Done?"
}

terinit

exit 0
