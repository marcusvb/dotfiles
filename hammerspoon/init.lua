hs.timer = require("hs.timer")

function caffeinateWatcher(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidUnlock) then
        print ("unlocked")
        hs.timer.usleep(1000000)
        hs.execute("open -a KeePassXC")
        killApps(100000)
    end
end

function killApps(time)
    -- Kill apps here after 15 seconds of sleeping
    hs.timer.usleep(time)
    hs.execute("pkill Citrix Reciever")
    hs.execute("pkill ReceiverHelper")
end

function autoMountHomeShares()
    hs.timer.usleep(1000000)
    -- Home SSID and the current one to execute the command
    homeSSID = "Carilloners"
    currentSSID = hs.wifi.currentNetwork()

    if (currentSSID == homeSSID) then
        hs.osascript.applescriptFromFile("mount.applescript")
    end
end


wifiWatcher = hs.wifi.watcher.new(autoMountHomeShares)
wifiWatcher:start()

sleepWatcher = hs.caffeinate.watcher.new(caffeinateWatcher)
sleepWatcher:start()

killApps(15000000)
