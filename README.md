# Dotfiles

## Usage
1. Copy your saved ssh keys to ~/.ssh/
2. Install Homebrew (with taps) and git

  ```bash
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install git
  ```
3. Clone this repository
  ```
  git clone git@github.com:marcusvb/dotfiles.git
  ```
4. Run the `bootstrap.sh` script

5. Install cronjob to backup keepass
```
# backup keepass
@reboot /Users/marcusvanbergen/repos/dotfiles/cronjob/backup_keepass.sh
@reboot /Users/marcusvanbergen/repos/dotfiles/cronjob/spotify_stoage_limit.sh
@reboot osascript  /Users/marcusvanbergen/repos/dotfiles/cronjob/sync_chrome_safari.scpt
```

### Root (/)
* bootstrap.sh - Calls all setup.sh scripts

### VSCode (vscode/)
* setup.sh - moves the config file to the vscode directory
* and it also installs the extensions from the list

### User Bin (bin/)
* setup.sh - Symlinks the other contents of the dotfiles/bin/ folder to ~/bin/
* togglehidden - A shell script that toggles between showing and hiding hidden
files
* sethidden - A shell script which takes command line arguments to show or hide
hidden files

### ZSH (zsh/)
* setup.sh - Symlinks the zshrc and .p10k.zsh to that of the home directory
* ~/.zshrc contains all aliases, and functions for the terminal
* .p10k.zsh contains the theme settings for POWER10K for zsh
* Don't forget to install ohmyzsh, extra plugins for .p10k.zsh, and setup iTerm to use proper encoding for charachters

#### Enabling Plugins (zsh-autosuggestions & zsh-syntax-highlighting)
 * Download zsh-autosuggestions by
 `git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`
 * Download zsh-syntax-highlighting by
 `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`


### Git (git/)
* setup.sh - Symlinks all git files to ~/
* .gitignore_global - Contains global gitignores, such as OS-specific files and
several compiled files
* .gitconfig - Sets several global Git variables

### OS X Preferences (osx/)
* set_defaults.sh - Executes a long list of commands pertaining to
OS X Preferences

### Packages (packages/)
* setup.sh - Installs the contents of the .list files

### Helper Scripts (scripts/)
* symlink.sh - Symlinks a file from a source path to a destination path in a
verbose way, unlinking the existing file first, might it exist

##### Big thanks to github.com/rkalis for original source code
