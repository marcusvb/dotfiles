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

# PATHS
# custom bin path
export PATH=~/bin:$PATH

PS1='%B%F{#ff1000}[%F{#d0b000}%n%F{#80f000}%b@%B%F{#00c0c0}%m %F{#ff80a0}%~%F{#ff1000}]%f%b$ '


####################################
# FUNCTIONS
####################################

function week(){
    date +%V
}

function toggle_hidden()
{
    STATUS=$(defaults read com.apple.Finder AppleShowAllFiles)
    if [ "$STATUS" -eq "1" ]
    then
        defaults write com.apple.Finder AppleShowAllFiles -bool false
    else
        defaults write com.apple.Finder AppleShowAllFiles -bool true
    fi
    killall Finder
}
function toggle_menubar() {
    bool=$(defaults read NSGlobalDomain _HIHideMenuBar)
    if [ "$bool" -eq "0" ]
    then
        defaults write NSGlobalDomain _HIHideMenuBar -bool true
    else
        defaults write NSGlobalDomain _HIHideMenuBar -bool false
    fi
    killall Finder
}
function lsa --description "List contents of directory, using haltr args"(){
    ls -haltr $argv
}
function pubkey(){
    cat ~/.ssh/id_rsa.pub | pbcopy; echo '=> Public key copied to pasteboard.'
}
function reset_dock(){
    defaults write com.apple.dock autohide-time-modifier -int 0
    defaults write .GlobalPreferences com.apple.mouse.scaling -1
    defaults write com.apple.dock autohide-time-modifier -float 0.1
    defaults write com.apple.dock autohide-delay -float 0
    killall Dock
}

function clear_preview(){
    defaults delete com.apple.Preview.LSSharedFileList RecentDocuments
    defaults write com.apple.Preview NSRecentDocumentsLimit 0
    defaults write com.apple.Preview.LSSharedFileList RecentDocuments -dict-add MaxAmount 0
    killall Dock
}

function empty_trash(){
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

function repo() {
    # Change directory to ~/repos if no arguments are provided
    if [[ $# -eq 0 ]]; then
        cd ~/repos
    else
        # Search for a matching folder in ~/repos
        local match=$(find ~/repos -mindepth 1 -maxdepth 2 -type d -name "*$1*" -print -quit)

        # If a matching folder is found, change directory to it
        if [[ -n $match ]]; then
            cd "$match"
        else
            echo "No matching folder found in ~/repos."
            cd ~/repos
        fi
    fi
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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


