function nvim
    if count $argv > /dev/null
        command nvim $argv
    else
        command nvim -c "Bclose"
    end
end

