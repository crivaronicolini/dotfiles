# para setear todo denuevo https://www.atlassian.com/git/tutorials/dotfiles

bind \eh backward-char
bind \el forward-char
bind \ej backward-word
bind \ek forward-word
bind \eH beginning-of-line
bind \eL end-of-line
bind \eo 'lfcd; commandline -f repaint'
bind -e \co
bind \cx 'fg 2>/dev/null'
bind \ed 'sd; commandline -f repaint'
bind \ch 'builtin cd ..; commandline -f repaint'
# bind \ef fzf-file-widget
# bind \ec fzf-cd-widget
# bind \eh fzf-history-widget

alias n "nvim"
alias clip "xsel -ib"
alias ipy "ipython --profile=marco"
alias g09 "wine /home/marco/.wine/drive_c/G09W/g09w.exe $argv"
alias gview "wine /home/marco/.wine/drive_c/G09W/gview.exe $argv"
alias pluto "julia -e 'using Pluto;Pluto.run()'"
alias julia "julia -J/home/marco/.config/julia/ohmyrepl.so"
alias bat 'bat $argv --pager="less -r"'
alias mvim 'nvim -u ~/.config/nvim/minimal.vim $argv'
alias jup2md 'jupyter nbconvert *.ipynb --to markdown '
alias jup2html 'jupyter nbconvert *.ipynb --to html '
# alias bell 'cvlc --play-and-exit ~/.vim/success_asyncrun.mp3 2>/dev/null'
# alias timer 'timer.py "$argv"; and bell'
alias en 'nvim ~/.config/nvim/init.vim'
alias el 'nvim ~/.config/lf/lfrc'
alias ef 'nvim ~/.config/fish/config.fish'
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias carne 'sxiv -g 1100x900+410+50 ~/pictures/tablatempcarne.jpg'
alias q 'qalc -i'
alias tls 'tlmgr search --global --file "/$argv"'
alias tli 'tlmgr install $argv'

# abbr -a gs 'git status'
abbr -a gp 'git pull'
abbr -a gP 'git push'
set -eg EDITOR

fzf_key_bindings

set PATH /home/marco/bin/ /home/marco/.local/bin /home/marco/bin /home/marco/.local/bin /usr/local/bin /usr/bin /var/lib/snapd/snap/bin /usr/local/sbin /var/lib/flatpak/exports/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /home/marco/Android/Sdk/emulator /home/marco/Android/Sdk/tools /home/marco/.platformio/penv/bin
