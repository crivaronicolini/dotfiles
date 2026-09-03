function fish_prompt
    set -l __last_command_exit_status $status
    if set -q __fish_prompt_last_command_status
        set __last_command_exit_status $__fish_prompt_last_command_status
    end

    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)
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
    set -l terraform_workspace
    if test -d .terraform
        if set -q TF_WORKSPACE; and test -n "$TF_WORKSPACE"
            set terraform_workspace $TF_WORKSPACE
        else if test -r .terraform/environment
            read terraform_workspace < .terraform/environment
        else
            set terraform_workspace default
        end
    end

    echo -n -s $cwd
    if test -n "$terraform_workspace"
        echo -n -s ' ' $magenta '[' $terraform_workspace ']'
    end
    echo -n -s $normal $arrow ' '

end

function __fish_prompt_notify_long_command --on-event fish_postexec
    set -g __fish_prompt_last_command_status $status

    if not set -q CMD_DURATION
        return
    end

    set -l command_line $argv[1]
    set -l command_name (string split -m 1 -- ' ' "$command_line")[1]
    if contains -- "$command_name" n nvim lazydocker lazygit spotify_player
        return
    end

    if test $CMD_DURATION -lt 60000
        return
    end

    if not command -sq notify-send
        return
    end

    set -l elapsed_seconds (math --scale=0 "$CMD_DURATION / 1000")
    if test -z "$command_line"
        set command_line Command
    end

    set -l result finished
    if test $__fish_prompt_last_command_status -ne 0
        set result "failed with status $__fish_prompt_last_command_status"
    end

    set -l notification_title "Command $result in "$elapsed_seconds"s"

    notify-send "$notification_title" "$command_line"
end
