function setenv
    set -l envfile .env
    if test (count $argv) -ge 1
        set envfile $argv[1]
    end

    if not test -f $envfile
        echo "setenv: file not found: $envfile" 1>&2
        return 1
    end

    for line in (cat $envfile)
        if test -n "$line" -a (string sub -l 1 -- "$line") != "#"
            set -gx (string split -m1 "=" -- $line)
        end
    end
end
