#!/bin/bash

if grep -q "storage.size" /Users/marcusvanbergen/Library/Application\ Support/Spotify/prefs
then
    :
else
    echo "storage.size=1024" >> /Users/marcusvanbergen/Library/Application\ Support/Spotify/prefs
fi
