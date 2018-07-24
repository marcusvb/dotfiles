require "hyper"
require "spectacle"
require "killapps"
require "wifi"
require "keepass"
require "lock"
require "vpn"

-----------------------------------------------
-- Reload config on write
-----------------------------------------------
function reload_config(files)
    hs.reload()
end

hyper:bind({}, "r", function()
  reload_config()
  hyper.triggered = true
end)

hs.pathwatcher.new(os.getenv("HOME") .. "/hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")
hs.timer = require("hs.timer")
