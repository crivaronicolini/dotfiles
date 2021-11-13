function now
    argparse -i 'n/notime' 'e/edit' 'm/minutes=' 'h/hours=' 'd/delete=' -- $argv
    set today ~/log/today
    set month (date +'%B')
    if not test -d ~/log/$month
        mkdir ~/log/$month
    end
    set datefile ~/log/$month/(date  +'%d-%m-%Y')
    if not test -e $datefile
        echo (date +'%A') > $datefile
        rm $today
        ln $datefile $today
    end

    if set -q _flag_e
        nvim $today
        return
    end

    function read_confirm
      while true
        read -l -P 'Do you want to continue? [y/N] ' confirm

        switch $confirm
          case Y y
            return 0
          case '' N n
            return 1
        end
      end
    end

    if set -q _flag_n
        echo $argv >> $today
    else if set -q _flag_d
        echo 'lineas a borrar:'\n
        tail -"$_flag_d" $today
        if read_confirm
            #raro, no puedo hacer > al $today
            head -n -"$_flag_d" $today > tmp
            cat tmp > $datefile
            rm tmp
        end
    else if set -q _flag_m and set -q _flag_h
        echo (date +'%R' --date "now -$_flag_h hour $_flag_m minutes") $argv >> $today
    else if set -q _flag_h
        echo (date +'%R' --date "now -$_flag_h hour") $argv >> $today
    else if set -q _flag_m
        echo (date +'%R' --date "now -$_flag_m minutes") $argv >> $today
    else if test (count $argv) -gt 0
        echo (date +'%H:%M') $argv >> $today
    end
    cat $today
end

