# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
function update
    sudo softwareupdate -i -a
    brew update
    brew upgrade --force --all
    brew cu
    brew cleanup
    brew doctor
    npm install npm -g
    npm update -g
    apm update
end
