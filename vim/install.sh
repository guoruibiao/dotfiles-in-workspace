#!/usr/bin bash

# 下载Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
拷贝vim配置文件
wget https://raw.githubusercontent.com/guoruibiao/dotfiles-in-workspace/master/vim/.vimrc

# 安装插件
```
vim
:PluginInstall
```
等待`done`字符出现即可.
