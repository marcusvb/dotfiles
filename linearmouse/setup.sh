#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/linearmouse)"

info "Setting up Visual Studio Code..."

substep_info "Creating Visual Studio Code folders..."
mkdir -p "$DESTINATION"

find * -not -name "setup.sh" -type f | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

cat "list-extensions" | xargs -L 1 echo code --install-extension

success "Finished setting up Visual Studio Code"
