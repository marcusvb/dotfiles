function jn
    if count $argv > /dev/null
        jupyter notebook $argv
    else
        jupyter notebook
    end
end


