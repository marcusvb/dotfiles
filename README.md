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
5. Install missing applications from the Mac App Store or Internet
  * [UvAVPN](http://student.uva.nl/en/az/content/uvavpn/\download/download-uvavpn-software.html)

6. Make sure owncloud is setup and run. For owncloud-homedir Symlinks run:
    ```
    sudo -v
    rm -rf ~/Documents
    rm -rf ~/Pictures
    rm -rf ~/Music
    rm -rf ~/Videos
    ln -s ~/ownCloud/documents ~/Documents
    ln -s ~/ownCloud/pictures ~/Pictures
    ln -s ~/ownCloud/music ~/Music
    ln -s ~/ownCloud/videos ~/Videos
    ln -s  ~/ownCloud/documents/personal_docs/work/ECP-KeePassX.app ECP-KeePassX.app
    ```

7. Swap /Applications/Pulse Secure.app/Contents/Plugins/JamUI/PulseTray.app/Contents/Resources rename the grayscaled to colored for grayscaled Pulse Secure icon in the menu bar.

### Root (/)
* bootstrap.sh - Calls all setup.sh scripts

### VSCode (vscode/)
* setup.sh - moves the config file to the vscode directory

### User Bin (bin/)
* setup.sh - Symlinks the other contents of the dotfiles/bin/ folder to ~/bin/
* togglehidden - A shell script that toggles between showing and hiding hidden
files
* sethidden - A shell script which takes command line arguments to show or hide
hidden files
* cudaon... - Custom IPMI commands for my homeserver

### Duti (duti/)
* setup.sh - Sets the defaults set up in the different files
* app.package.id - Contains all extensions for the specified program

### Fish (fish/)
* setup.sh - Symlinks all fish files to their corresponding location in
~/.config/fish/
* config.fish - Adds ~/bin to PATH
* completions/
  * repo.fish - Contains all repos as completions for the repo command
* functions/
  * clear.fish - Clears the screen and shows fish_greeting
  * emptytrash.fish - Empties trash and clears system logs
  * fish_greeting.fish - My personal fish greeting using the
  full-colour fish logo
  * fish_prompt.fish - The Classic + Git prompt from the fish web config
  * ls.fish - Calling ls with parameter --color=auto
  * pubkey.fish - Copies the public key to the clipboard
  * repo.fish - Finds a repository and jumps to it
  * setup.fish - Initial setup for a new fish installation,
  contains abbreviations
  * update.fish - Installs OS X Software Updates, updates Ruby gems, Homebrew,
  npm, and their installed packages
  * week.fish - Returns the current week number

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
