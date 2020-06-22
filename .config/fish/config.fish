# para setear todo denuevo https://www.atlassian.com/git/tutorials/dotfiles

bind \eh backward-char
bind \el forward-char
bind \eH beginning-of-line
bind \eL end-of-line
bind \co 'lfcd; commandline -f repaint'
bind \cx 'fg 2>/dev/null'

alias mvim 'nvim -u ~/.config/nvim/minvimrc.vim'
alias jup2md 'jupyter nbconvert *.ipynb --to markdown'
alias bell 'cvlc --play-and-exit ~/.vim/success_asyncrun.mp3 2>/dev/null'
alias l lfcd
alias timer 'timer.py "$argv"; and bell'
alias en 'nvim ~/.config/nvim/init.vim'
alias el 'nvim ~/.config/lf/lfrc'
alias ef 'nvim ~/.config/fish/config.fish'
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# alias cd 'cd "$argv"; and ls'

function cd
if count $argv > /dev/null
    builtin cd "$argv"; and ls
else
    builtin cd ~; and ls
end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/marco/repos/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

function __conda_add_prompt
end
