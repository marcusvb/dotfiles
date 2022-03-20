-- close google chrome to perform importing
do shell script "killall \"Google Chrome\" || echo \"Google Chrome is not running.\""

do shell script "killall Safari || echo \"Safari is not running.\""
tell application "Safari" to activate


-- import history, bookmarks, passwords from google chrome to safari
tell application "System Events" to tell process "Safari"
	log "Syncing..."
	tell menu item "Import From" of menu "File" of menu bar item "File" of menu bar 1
		tell menu "Import From"
			click menu item "Google Chrome.app…"
		end tell
	end tell
	tell application "System Events" to set visible of application process "Safari" to true
	delay 2
	keystroke return
	delay 10
	log "Complete sync"
end tell

-- close safari
do shell script "killall Safari || echo \"Safari is not running.\""

-- restore chrome closed tabs and minimize window in background
delay 0.5
log "Opening chrome in background"
do shell script "open -a \"Google Chrome\" --args --restore-last-session --no-startup-window"
