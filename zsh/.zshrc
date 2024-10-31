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
        echo Hiding hidden files
        defaults write com.apple.Finder AppleShowAllFiles -bool false
    else
        echo Showing hidden files
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


function sync_bookmarks() {
    # Step 1: Check if Google Chrome is running and quit it
    if pgrep -x "Google Chrome" > /dev/null; then
        echo "Quitting Google Chrome..."
        osascript -e 'tell application "Google Chrome" to quit'
    else
        echo "Google Chrome is not running."
    fi

    # Step 2: Open Safari if not already running, or bring it to the front if it is
    if ! pgrep -x "Safari" > /dev/null; then
        echo "Opening Safari..."
        open -a "Safari"
        sleep 2 # give Safari time to open
    else
        echo "Safari is already running. Bringing it to the front."
        osascript -e 'tell application "Safari" to activate'
    fi

    # Step 3: Automate the process of opening "Import From" and selecting "Google Chrome..." in Safari
    echo "Importing bookmarks from Google Chrome to Safari..."
    osascript <<EOF
    tell application "Safari"
        activate
        delay 1
    end tell
    tell application "System Events"
        tell process "Safari"
            click menu item "Import From" of menu "File" of menu bar 1
            delay 1
            click menu item "Google Chrome…" of menu 1 of menu item "Import From" of menu "File" of menu bar 1
            delay 1
            keystroke return
        end tell
    end tell
EOF

    # Step 4: Quit Safari
    echo "Quitting Safari..."
    sleep 2
    killall "Safari" # Force quits Safari

    # Step 5: Reopen Google Chrome
    echo "Reopening Google Chrome..."
    open -a "Google Chrome"

}



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# RUST
. "$HOME/.cargo/env"
