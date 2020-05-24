#! /usr/bin/env sh

info "Setting up zsh config..."

rm -rf ~/.zshrc

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

symlink "$SOURCE/.zshrc" "$DESTINATION/.zshrc"

symlink "$SOURCE/.p10k.zsh" "$DESTINATION/.p10k.zsh"

# clear_broken_symlinks "$DESTINATION" DONT DO THIS ON HOME DIR

success "Finished setting up user bin."
