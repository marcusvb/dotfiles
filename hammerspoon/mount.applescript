tell application "Finder"
	try
		mount volume "smb://freenas/fileshare"
		mount volume "smb://freenas/media"
	end try
end tell
