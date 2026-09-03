function fish_right_prompt
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showupstream auto
    printf '%s' (fish_git_prompt)
    if set -q __fish_right_prompt_command_started_at
        printf ' %s' $__fish_right_prompt_command_started_at
        if test $CMD_DURATION
            printf ' '
        end
    end
    if test $CMD_DURATION
        # Convert milliseconds to seconds and format to 3 decimal places
        set duration (math --scale=3 "$CMD_DURATION / 1000")
        echo "("(date -d"@$duration" -u +"%M:%S")")"
    end
end

function __fish_right_prompt_record_command_start --on-event fish_preexec
    set -g __fish_right_prompt_command_started_at (date +"%H:%M:%S")
end
