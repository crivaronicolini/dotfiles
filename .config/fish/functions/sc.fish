function sc -d "usa fzf para editar archivos en config"
    set arc (fdfind --type f . ~/bin ~/.config/nvim ~/.config/fish ~/.config/lf | fzf -m --reverse --height 40% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200')
    # set arc (fzf -m --height 40% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200')
    if [ -z $arc ]
        return
    else
        nvim $arc
    end
end

