function fish_greeting
    echo 'p  r  á  c  t  i  c  a    p r á c t i c a  práctica'
    set w (whatis (fd . /usr/bin/ | shuf -n 5) 2>/dev/null)
    echo -e '\033[1m'(echo $w[1]| cut -d ' ' -f 1)'\033[0m' (echo $w[1]| cut -d ' ' --complement -f 1)
    history merge
end

