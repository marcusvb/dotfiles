# FOR PK10 theme first run:
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k


# Path to your oh-my-zsh installation.
export ZSH="/Users/marcus/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker kubectl python rsync screen zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Aliases
alias jn='jupyter notebook'
alias lsc='ls -lhSar'

# TMP MSC THESIS aliases
alias ul='rsync -avzp --exclude="*".pickle /Users/marcus/repos/master-thesis/code/* lisa:~/code'
alias dl='rsync -avzp lisa:~/code/"*".pickle /Users/marcus/repos/master-thesis/code/'

# PATHS
# custom bin path
export PATH=~/bin:$PATH

# java home
# export JAVA_HOME "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"



####################################
# FUNCTIONS
####################################

function week(){
    date +%V
}


function clear_preview(){
    defaults delete com.apple.Preview.LSSharedFileList RecentDocuments
    defaults write com.apple.Preview NSRecentDocumentsLimit 0
    defaults write com.apple.Preview.LSSharedFileList RecentDocuments -dict-add MaxAmount 0
    killall Dock
}

function emptytrash(){
    sudo rm -rfv /Volumes/*/.Trashes
    sudo rm -rfv ~/.Trash
    sudo rm -rfv /private/var/log/asl/*.asl
    sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
}

function gitstatus(){
    find . -name .git -execdir git rev-parse --show-toplevel \; -execdir git status -s \;
}

function hide_iterm(){
    /usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/iTerm.app/Contents/Info.plist
}

function show_iterm(){
    /usr/libexec/PlistBuddy -c 'Delete :LSUIElement' /Applications/iTerm.app/Contents/Info.plist
}


function lsa --description "List contents of directory, using haltr args"(){
    ls -haltr $argv
}

function pubkey(){
    cat ~/.ssh/id_rsa.pub | pbcopy; echo '=> Public key copied to pasteboard.'
}

function repo(){
    cd ~/repos
}

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
function update(){
    sudo softwareupdate -i -a
    brew update
    brew upgrade --force
    brew cu -fa
    brew cleanup
    brew doctor
    brew cask doctor
    rm -rf $(brew --cache)
}


# function repodir(){
#     set repo_base ~/repos
#     set repo_path (find "$repo_base" -mindepth 1 -maxdepth 10 -type d -name "*$argv*" | head -n 1)
#     if not test "$argv"; || not test "$repo_path"; then
#         set repo_path "$repo_base"
#     fi
#     echo "$repo_path"
# }


# function forrepos --description 'Evaluates $argv for all repo folders'(){
#     for d in (find ~/repos -mindepth 2 -maxdepth 2 ! -path . -type d); do
#         pushd $d
#         set repo (basename $d)
#         echo $repo
#         eval (abbrex $argv)
#         popd > /dev/null
#     done
# }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marcus/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marcus/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marcus/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marcus/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

