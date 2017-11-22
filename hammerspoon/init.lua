hs.timer = require("hs.timer")

function caffeinateWatcher(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidUnlock) then
        print ("unlocked")
        hs.timer.usleep(3000000)
        hs.execute("open -a KeePassXC")
    end
end

sleepWatcher = hs.caffeinate.watcher.new(caffeinateWatcher)
sleepWatcher:start()
