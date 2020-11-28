#!/bin/sh 
sed -n "1!{s/\(^.\):\(.*\)/nnoremap \'c\1 :cd \2<CR>/p}" ~/.local/share/lf/marks > /home/marco/.config/nvim/bookmarks.vim
