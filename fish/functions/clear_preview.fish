function clear_preview
    defaults delete com.apple.Preview.LSSharedFileList RecentDocuments
    defaults write com.apple.Preview NSRecentDocumentsLimit 0
    defaults write com.apple.Preview.LSSharedFileList RecentDocuments -dict-add MaxAmount 0
    killall Dock
end
