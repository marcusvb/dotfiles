function killApps(time)
    -- Kill apps here after 15 seconds of sleeping
    hs.timer.usleep(time)
    hs.execute("pkill Citrix Reciever")
    hs.execute("pkill ReceiverHelper")
end

killApps(15000000)
