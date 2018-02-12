set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"

set -x -g TERM "xterm-256color"

# Coreutils bin and man folders
set -x -g PATH (brew --prefix coreutils)/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

# Findutils bin and man folders
#set -x -g PATH (brew --prefix findutils)/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix findutils)/libexec/gnuman $MANPATH

# User bin folder
set -x -g PATH $PATH ~/bin /usr/local/sbin

#for mvn ECP
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home"

#set home for anaconda
#set -x  PATH /usr/local/anaconda3/bin $PATH

#python2 of homebrew
#export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#jupyter notebook salias
alias jn='jupyter notebook'

#maven aliases
alias mci='mvn clean install -T 1C -Dlockdown=true'
alias mcis='mvn clean install -T 1C -DskipTests'
alias mcio='mvn clean install -o -T 1C -Dlockdown=true'
alias mcios='mvn clean install -o -T 1C -DskipTests'
alias mi='mvn install -T 1C -Dlockdown=true'
alias mio='mvn install -o -T 1C -Dlockdown=true'
alias mios='mvn clean install -o -T 1C -DskipTests'


