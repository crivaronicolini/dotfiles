function fish_prompt
    set -l __last_command_exit_status $status

    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l normal (set_color normal)

    set -l arrow_color "$blue"
    if test $__last_command_exit_status != 0
        set arrow_color "$red"
    end

    set -l arrow " $arrow_color\$"
    if test "$USER" = root
        set arrow " $arrow_color#"
    end

    set -l cwd $green(prompt_pwd)

    echo -n -s $cwd $normal $arrow ' '

end
