hs.timer = require("hs.timer")

function caffeinateWatcher(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidUnlock) then
        print ("unlocked")
        hs.timer.usleep(1000000)
        hs.execute("open -a KeePassXC")
        killApps(100000)
    end
    -- For restarting PB for desktop after sleep because it's momentarilly very
    -- buggy.
    -- if (eventType == hs.caffeinate.watcher.screensDidWake) then
    --     print("staring PB")
    --     hs.execute([[open --background -a  PB\ for\ Desktop]])
    -- end
    -- -- After screen sleep we kill PB because we'll start it in background
    -- -- after screen on
    -- if (eventType == hs.caffeinate.watcher.screensDidSleep) then
    --     print("Killing PB")
    --     hs.execute([[pkill PB\ for\ Desktop]])
    -- end
end

function killApps(time)
    -- Kill apps here after 15 seconds of sleeping

    hs.timer.usleep(time)
    hs.execute("pkill Citrix Reciever")
    hs.execute("pkill ReceiverHelper")
    print("killed citrix")
end

sleepWatcher = hs.caffeinate.watcher.new(caffeinateWatcher)
sleepWatcher:start()
killApps(15000000)
