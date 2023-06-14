function sd -d "usa fzf para abrir documentos en nvim"
    # builtin cd ~/Documents
    set arc (fd --type f . ~/documents | fzf -m --reverse --height 40% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200')
    if [ -z $arc ]
        return 0
    else
        # set ext (string split -r -m1 . $arc)[2]
        # set textext "" "txt" "md" "tex" "csv"
        # if contains -- $ext $textext
        #     nvim $arc
        # else
        #     open $arc
        # end
        switch (file --mime-type $arc -b)
            case 'text/csv'
                sc-im arc
            case 'text/*'
                nvim $arc
            case '*'
                open $arc
        end
    end
end

