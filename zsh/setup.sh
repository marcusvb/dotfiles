#! /usr/bin/env sh

BASE=$(basename "$(pwd)")
DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up $BASE..."

symlink "$SOURCE/.zshrc" "$DESTINATION/.zshrc"
symlink "$SOURCE/.p10k.zsh" "$DESTINATION/.p10k.zsh"

success "Finished setting up $BASE"
