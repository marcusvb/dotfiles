function repo
    set -l repo_path (find ~/repos -mindepth 1 -maxdepth 1 -type d -name "*$argv*" | head -n 1)
    echo "found $repo_path"
    cd "$repo_path"
end
