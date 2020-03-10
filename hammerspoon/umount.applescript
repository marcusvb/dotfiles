tell application "Finder"
	try
		eject disk "fileshare"
		eject disk "media"
	end try
end tell
