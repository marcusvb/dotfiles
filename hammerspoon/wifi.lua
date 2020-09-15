-- function autoMountHomeShares()
--     hs.timer.usleep(1000000)
--     -- Home SSID and the current one to execute the command
--     homeSSID = "Carilloners"
--     currentSSID = hs.wifi.currentNetwork()

--     if (currentSSID == homeSSID) then
--         hs.osascript.applescriptFromFile("mount.applescript")
--     else
--         hs.osascript.applescriptFromFile("umount.applescript")
--     end
-- end

-- wifiWatcher = hs.wifi.watcher.new(autoMountHomeShares)
-- wifiWatcher:start()


