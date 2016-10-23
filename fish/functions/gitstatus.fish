function gitstatus
    find . -name .git -execdir git rev-parse --show-toplevel \; -execdir git status -s \;
end
