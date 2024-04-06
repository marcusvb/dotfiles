DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath1)"
DESTINATION="$(realpath1 ~/.hammerspoon)"

info "Setting up Karabiner Elements..."

substep_info "Creating Karabiner Elements folder..."
mkdir -p $DESTINATION

find . -name "*.lua" -o -name "*.applescript" -o -name "*.js" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

clear_broken_symlinks "$DESTINATION"

success "Finished setting up Hammerspoon."
