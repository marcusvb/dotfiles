
# Remap caps lock to F14
# Sources
# http://homeowmorphism.com/2017/05/27/Remap-CapsLock-Backspace-Sierra
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html

# Then CD into this directory, and to apply this script at log in use this:
# sudo defaults write com.apple.loginwindow LoginHook `pwd`/rebind-capslock.sh

hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000069}]}'
