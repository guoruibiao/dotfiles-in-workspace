# .bash_profile

# 以下文件已脱敏，不涉及公司信息，如有任何问题，请联系我本人进行删除。

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
#alias scn="echo $STY"
#alias scl="screen -ls"
#alias scr="screen -r "
#alias sc="screen "
alias ll="ls -ltr"
alias ls="ls -F --color=auto"
alias lt="ls -ltrh --color=auto"
#PATH=$PATH:$HOME/bin

#alias wp='cd /home/work/go/src'
#export TIME_STYLE='+%Y-%m-%d %H:%M:%S'

# golang 相关配置
PATH=$PATH:$HOME/bin
export GOPATH=/home/work/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=/opt/compiler/gcc-8.2/bin:$PATH


#PHP 内容相关
alias php='/home/work/odp/php/bin/php'

#git 相关别名
alias gs='git status'
alias gr='git branch -v'
alias gco='git checkout '
alias gba='git branch --all'
alias gp='bash /home/work/guoruibiao/tools/gitpush.sh '

# 工具别名
alias myman='bash /home/work/guoruibiao/myman/myman.sh'
alias httpproxy='/home/work/guoruibiao/tools/httpproxy -port 8888'
alias webcopy='cd /home/work/guoruibiao/tools/webcopy/ && ./webcopy'
alias sunflower='cd /home/work/guoruibiao/sunflower/   && nohup ./sunflower >>/tmp/sunflower.log &'
alias wrk='/home/work/guoruibiao/wrk-master/wrk'



# 远程调试
alias dlvdebug='/home/work/guoruibiao/dlv debug --headless --listen=:8033 --api-version=2'


# 登录短带 Redis 查看数据信息
alias duandai_redis='bash /home/work/guoruibiao/tools/hk-creator-activity-redis.sh'

# 一些工具目录
alias cdhadoop='cd /home/work/guoruibiao/hadoop/hadoop-client'
alias startmysql='~/.jumbo/share/mysql/mysql.server start'

# 添加一些登录即触发的命令
wp
