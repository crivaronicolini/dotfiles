# para setear todo denuevo https://www.atlassian.com/git/tutorials/dotfiles

bind \eh backward-char
bind \el forward-char
bind \eH beginning-of-line
bind \eL end-of-line
# bind \eo 'stty sane; lfcd; commandline -f repaint'
bind \eo 'lfcd; commandline -f repaint'
# bind \eo 'lfcd; printf "\033[J"'
bind \cx 'fg 2>/dev/null'
bind \ed 'sd'

alias mvim 'nvim -u ~/.config/nvim/minimal.vim $argv'
alias jup2md 'jupyter nbconvert *.ipynb --to markdown '
# alias bell 'cvlc --play-and-exit ~/.vim/success_asyncrun.mp3 2>/dev/null'
alias timer 'timer.py "$argv"; and bell'
alias en 'nvim ~/.config/nvim/init.vim'
alias el 'nvim ~/.config/lf/lfrc'
alias ef 'nvim ~/.config/fish/config.fish'
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias carne 'sxiv -g 1100x900+410+50 ~/pictures/tablatempcarne.jpg'
alias q 'qalc -i'
alias tls 'tlmgr search --global --file "/$argv"'
alias tli 'tlmgr install $argv'


fzf_key_bindings
# bind \cu 'set fish_key_bindings fish_vi_key_bindings'
# bind \cU 'set fish_key_bindings fish_default_key_bindings'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/marco/repos/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

function __conda_add_prompt
end
