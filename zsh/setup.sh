#! /usr/bin/env sh

info "Setting up zsh config..."

rm -rf ~/.zshrc

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

symlink "$SOURCE/.zshrc" "$DESTINATION/.zshrc"
# clear_broken_symlinks "$DESTINATION" DONT DO THIS ON HOME DIR

success "Finished setting up user bin."
