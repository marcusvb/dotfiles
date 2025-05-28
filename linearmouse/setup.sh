#! /usr/bin/env sh

BASE=$(basename "$(pwd)")
DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/linearmouse)"

info "Setting up $BASE..."

substep_info "Creating $BASE folders..."
mkdir -p "$DESTINATION"

find * -not -name "setup.sh" -type f | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished setting up $BASE"
