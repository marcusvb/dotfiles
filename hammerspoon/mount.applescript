tell application "Finder"
	try
		mount volume "smb://ubntnas01/fileshare"
		mount volume "smb://ubntnas01/media"
	end try
end tell
