#! /usr/bin/env sh

curl -s https://raw.githubusercontent.com/actuallymentor/battery/main/setup.sh | bash
battery maintain 77-85 --force-discharge
