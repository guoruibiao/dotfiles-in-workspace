#!/usr/bin bash

# 下载安装tmux
- 有包管理器的OS： 如Ubuntu: `$ sudo apt-get install tmux`
- 使用源码来安装：
    ```
    $ git clone https://github.com/tmux/tmux.git
    $ cd tmux
    $ sh autogen.sh
    $ ./configure && make
    $ sudo make install
    ```

# 拷贝配置文件
```
$ wget https://github.com/guoruibiao/dotfiles-in-workspace/blob/master/tmux/.tmux.conf
```

# 如果已经打开了tmux, 重启tmux即可; 如果没有打开，直接打开一个新的会话即可看到定制好的tmux
```
$ tmux new-session -s workspace
```
