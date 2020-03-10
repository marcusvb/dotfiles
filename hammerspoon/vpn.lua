-- hyper:bind({}, "e", function()
--     hs.notify.new( {title="VPN", subTitle="Starting VPN connection to ECP"} ):send()
--     return hs.osascript.applescript(
--         string.format('tell application "Tunnelblick" \
--                         connect "ECP" \
--                       end tell')
--     )
-- end)

hyper:bind({}, "m", function()
    hs.notify.new( {title="VPN", subTitle="Starting VPN connection to Marcus - Home"} ):send()
    return hs.osascript.applescript(
        string.format('tell application "Tunnelblick" \
                        connect "Marcus - Home" \
                      end tell')
    )
end)

hyper:bind({}, "x", function()
    hs.notify.new( {title="VPN", subTitle="Killing all VPN connections"} ):send()
    return hs.osascript.applescript(
        'tell application "Tunnelblick" \
           disconnect all \
         end tell'
    )
end)
