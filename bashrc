# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# keep color in less
export LESS='-R'
# encoding - our one true friend
export LESSCHARSET='UTF-8'
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# ignore svn and git directories on file auto completion
# (very handy for cd in svn-projects)
export FIGNORE='.svn:.git'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# tmux stuff
export TERM="xterm-256color"
alias tmux="tmux -2"
settitle() {
    printf "\033k$1\033\\"
}
ssh() {
    settitle "$*"
    command ssh "$@"
    settitle "bash"
}
alias tm-rename='tmux rename-window `basename $PWD`'

if [ -f ~/.git-prompt.sh ]
    then
        source ~/.git-prompt.sh
fi

export EDITOR=vim
PATH=$PATH:$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin:$HOME/bin:$HOME/.symfony/bin

# ansi color escape sequences
prompt_black='\[\e[30m\]'
prompt_red='\[\e[31m\]'
prompt_green='\[\e[32m\]'
prompt_yellow='\[\e[33m\]'
prompt_blue='\[\e[34m\]'
prompt_magenta='\[\e[35m\]'
prompt_cyan='\[\e[36m\]'
prompt_white='\[\e[37m\]'
prompt_default_color='\[\e[0m\]'
prompt_git_ps1='$(__git_ps1 "\\ue0a0%s")'

prompt_folder=$'\ue5fe'
prompt_time=$'\uf64f'

export GIT_PS1_SHOWDIRTYSTATE=1
PS1="\[\e]0;\w\a\]\n${prompt_time} \t ${prompt_blue}\u@\h ${prompt_yellow}${prompt_folder} \w ${prompt_cyan}${prompt_git_ps1}${prompt_default_color}\n\$ "

# Alias
alias ls="ls --group-directories-first --color=auto"
alias l='ls -aFlh'
alias ll='ls -lah'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias service='sudo service'

alias grep='grep --color=auto --exclude-dir=.svn'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias mkdir='mkdir -p'

# Other
alias now='date +"%T'
alias portsnum='netstat -tan'
alias ports='sudo netstat -tulpen'
alias hisgrep='history | grep --color=auto'
alias syslog='tail -f /var/log/syslog'
alias t='task'
alias please='sudo "$BASH" -c "$(history -p !!)"'

# git
alias git-delete-merged-branches='git checkout master && git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git-show-unrebased-branches='{ git br --contains master; git br; } | sort | uniq -u'
alias git-log='git log --name-status'

# Bash Directory Bookmarks
alias m0='alias g0="cd `pwd`"'
alias m1='alias g1="cd `pwd`"'
alias m2='alias g2="cd `pwd`"'
alias m3='alias g3="cd `pwd`"'
alias m4='alias g4="cd `pwd`"'
alias m5='alias g5="cd `pwd`"'
alias m6='alias g6="cd `pwd`"'
alias m7='alias g7="cd `pwd`"'
alias m8='alias g8="cd `pwd`"'
alias m9='alias g9="cd `pwd`"'
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'
alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias m"|sed "s/alias //"'
touch ~/.bookmarks
source ~/.bookmarks


# symfony2
alias sf='php bin/console '

# fast vim (without config) for editing large files
# -n see https://twitter.com/climagic/status/972222597462134785?s=03
alias vim-fast='vim -n -u NONE'

# www specials alias
alias www='sudo -u www-data '

# open in default linux app
alias o='xdg-open'

# extract archive
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.tar.xz)    tar xJf $1     ;;
        *.xz)        unxz $1        ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


export LS_COLORS='rs=0:di=01;94:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;94:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

# here the user can hook in and
# add personal or host specific configuration
[ -e ~/.bashrc.local ] && source ~/.bashrc.local

# force svn diff to use a pager
svn() {
    if [ x"$1" = xdiff ] || [ x"$1" = xdi ]; then
        /usr/bin/svn "$@" | less -R
    else
        /usr/bin/svn "$@"
    fi
}


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
