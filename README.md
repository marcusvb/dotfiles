# Dotfiles

## Usage
1. Copy your saved ssh keys to ~/.ssh/
1. `xcode-select --install`
1. Install Homebrew (and git)
    ```bash
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install git
    ```

1. Clone this repository
    ```
    git clone git@github.com:marcusvb/dotfiles.git
    ```

1. Setup macOs/ folder, and set keybinds (if needed) and defaults

1. Remapping keys:

    * Remapping §/± key to \`/~
    * copy paste the `com.marcus.remapkeys.plist` file to `/Library/LaunchDaemons/`
    * Activate this with `sudo launchctl load -w /Library/LaunchDaemons/com.marcus.remapkeys.plist`

    #### Karabiner
    Run `setup.sh` which:
    * maps F6 -> F16 (work around that DnD button doesn't continue to work by default)
    * maps the dictation key to execute the mute script

    ### MacOs key remapping (this needs to be manually set in the macOs settings)
    #### Keyboard (section)
    Move focus to next window -> CMD+§

    #### Mission control
    `Turn off Do Not Disturb -> F16` (see above where we map to f16 using karabiner, and here we set macOs to recognize this)
    Dictation key is mapped to execute mute script

    #### Modifier keys
    `Caplock key -> ^ Control` (right control - macOS just doesn't specify this. Allows us to use this as a hotkey for Loop)

1. Go through the dirs and apply what you want, e.g. `cd/vscode; ./setup.sh`

1. Open `Loop` application and import the `keybinds.json`

1. Open `ITerm` > general > settings > load from `/Users/marcus/repos/dotfiles/iterm` and "import all settings and data". In `Profiles` load in the `Hotkey Window.json`

1. Install cronjob to backup keepass
```
# backup keepass
@reboot /Users/marcus/repos/dotfiles/cronjob/backup_keepass.sh
```

### Cronjob
* backup_keepass.sh - contains a script to cp the keepass db

### Git (git/)
* .gitignore_global - Contains global gitignores, such as OS-specific files and
several compiled files
* .gitconfig - Sets several global Git variables

### iTerm
* Hotkey Window.json - contains the hotkey.json for the drop down window
* com.googlecode.iterm2.plist - contains all other preferences for the iterm app

### Karabiner
* karabiner.json - contains the config for karabiner to map / apply actions on certain key events
* mute-mic.script - self explanatory

### Loop
* keybinds.json - Manually import this window mapping export


### macOS Preferences (macos/)
* setup.sh - Executes a long list of commands pertaining to macOS Preferences
* com.marcus.remapkeys.plist - contains the remapping for dutch keyboard to similar US equivalent

### VSCode (vscode/)
* keybindings.json - keybindings config file
* settings.json

### ZSH (zsh/)
* setup.sh - Symlinks the zshrc and .p10k.zsh to that of the home directory
* ~/.zshrc contains all aliases, and functions for the terminal
* .p10k.zsh contains the theme settings for POWER10K for zsh
* Don't forget to install ohmyzsh, extra plugins for .p10k.zsh, and setup iTerm to use proper encoding for characters

#### Enabling Plugins (zsh-autosuggestions & zsh-syntax-highlighting)
- `git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`
- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
- `git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions`

### Packages (packages/)
* setup.sh - Installs the contents of the .list files

### Helper Scripts (scripts/)
* symlink.sh - Symlinks a file from a source path to a destination path in a
verbose way, unlinking the existing file first, might it exist

##### Big thanks to github.com/rkalis for original source code
