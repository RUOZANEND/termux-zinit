#!/data/data/com.termux/files/usr/bin/bash

termirrors () {
    sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.bfsu.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
    sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.bfsu.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
    sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.bfsu.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
    yes y | pkg up >/dev/null
}

zshconf () {
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin --depth 1
    cat $HOME/.termux/terinit/conf/zshrc.zsh > $HOME/.zshrc
    cat $HOME/.termux/terinit/conf/p10k.zsh > $HOME/.p10k.zsh
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
    pkg i git subversion zsh fd fzf exa lua53 neofetch tar wget -y
    git clone https://github.com/rvvcim/terinit.git $HOME/.termux/terinit
    cp -r $HOME/.termux/terinit/termux/.* $HOME/.termux
    zshconf
    termux-reload-settings
    zsh
    echo "Done?"
}

terinit

exit 0
