function randfile
    set new (fd . $argv | shuf -n 1)
    if test -e ./last
        if test (cat ./last) = "$new"
            randf $argv
        end
    end
    echo $new > last
    echo $new
end

