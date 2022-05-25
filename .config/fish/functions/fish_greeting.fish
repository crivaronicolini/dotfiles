function fish_greeting

    echo 'p  r  á  c  t  i  c  a    p r á c t i c a  práctica'
    set w (whatis (fd . $PATH[3..11] | shuf -n 1))
    echo -e '\033[1m'(echo $w| cut -d ' ' -f 1)'\033[0m' (echo $w| cut -d ' ' --complement -f 1)
    history merge
end

