# Keyboard modifications

## Remapping §/± key to `/~
copy paste the `com.marcus.remapkeys.plist` file to `/Library/LaunchDaemons/`
Then activate this with `sudo launchctl load -w /Library/LaunchDaemons/com.marcus.remapkeys.plist`

## Karabiner
Load in the `karabiner.json` file which:
- maps F6 -> F16 (work around that DnD button doesn't continue to work by default)
- maps the dictation key to execute the mute script

## MacOs key remapping (this needs to be manually set in the macOs settings)
### Keyboard (section)
Move focus to next window -> CMD+§

### Mission control
Turn off Do Not Disturb -> F16 (see above where we map to f16 using karabiner, and here we set macOs to recognize this)
Dictation key is mapped to execute mute script

### Modifier keys
Caplock key -> ^ Control (right control - macOS just doesn't specify this. Allows us to use this as a hotkey for Loop)


