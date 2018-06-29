tell application "Finder"
	try
		mount volume "smb://freenas01/fileshare"
		mount volume "smb://freenas01/media"
	end try
end tell
