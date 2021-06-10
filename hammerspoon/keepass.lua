function caffeinateWatcher(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidUnlock) then
        print ("unlocked")
        hs.timer.usleep(1000000)
        hs.execute("open -a KeeWeb")
        killApps(100000)
    end
end

sleepWatcher = hs.caffeinate.watcher.new(caffeinateWatcher)
sleepWatcher:start()
