#! /usr/bin/env sh

# Ask for sudo upfront
if [ "$EUID" -ne 0 ]; then
  echo "This script requires sudo privileges. Rerun with sudo command. E.g.: sudo !!"
  exit 1
fi


BASE=$(basename "$(pwd)")
DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath /Library/LaunchDaemons/)"

info "Setting up $BASE..."

substep_info "Creating $BASE folders..."
mkdir -p "$DESTINATION"

find * -not -name "setup.sh" -type f | while read fn; do
    cp -r "$SOURCE/$fn" "$DESTINATION/$fn"
done


sudo launchctl load -w /Library/LaunchDaemons/com.marcus.remapkeys.plist

success "Finished setting up $BASE"
