#!/bin/bash

if grep -q "storage.size" /Users/marcus/Library/Application\ Support/Spotify/prefs
then
    :
else
    echo "storage.size=1024" >> /Users/marcus/Library/Application\ Support/Spotify/prefs
fi
