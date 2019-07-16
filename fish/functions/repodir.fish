function repodir
    set repo_base ~/repos
    set repo_path (find "$repo_base" -mindepth 1 -maxdepth 10 -type d -name "*$argv*" | head -n 1)
    if not test "$argv"; or not test "$repo_path"
        set repo_path "$repo_base"
    end
    echo "$repo_path"
end
