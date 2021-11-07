# dotfiles

My Dotfiles

~~~txt
    ################################################################  ##    ##################
 ###################################################################  ##  ####              ##
#############\"""""=-.######|""/####/""=..==./""=###################  ##  ##    tomo-awa    ##
##############|  \#\  \###/""  ""/#|  |##\__/|  |##_.._#####__######  ##  ##              ####
#####.-=-.####|  |#|  |-"""-|  |#/_   _/#|""||  |/" __ "\/""__.\####  ##  ####################
####|     |###|  /#/  / (#) |  |###|  |##|  ||  |  <___/_\.__  \####  ##  ####              ##
#####"-=-"###/____.-="\.___.\_./#\"__./##\_.//_./\.____.//__..-/####  ##  ##   sice  2021   ##
###################################################################   ##  ##              ####
################################################################      ##  ##################
~~~

## 対応したいもの

- bash(setup shell)
- homebrew
  - git
  - zsh(main shell)
  - tmux
  - vim
- Vscode(?)
- etc...

## wsl, homebrewでgccがインストールができない 20211107

wsl: Ubuntu20.04LTS

### `brew install gcc`が通らない

~~~sh
Error: The following formulae cannot be installed from bottles and must be
built from source.
  m4, binutils and gcc@5
Install Clang or run `brew install gcc`.
~~~

### 解決策

`sudo apt-get install build-essential`で依存関係を解決

### 参考

[Can't install gcc on WSL for Ubuntu #13596](https://github.com/Homebrew/linuxbrew-core/issues/13596)

## 参考資料

[ようこそdotfilesの世界へ](https://qiita.com/yutkat/items/c6c7584d9795799ee164)

[最強の dotfiles 駆動開発と GitHub で管理する運用方法](https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2)
