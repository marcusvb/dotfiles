#!/bin/bash

(crontab -l 2>/dev/null; echo '@reboot /Users/marcus/repos/dotfiles/crontab/backup_keepass.sh') | sort -u | crontab -
