function fish_prompt
    set -l __last_command_exit_status $status

    if not set -q -g __fish_robbyrussell_functions_defined
        set -g __fish_robbyrussell_functions_defined
        function _git_branch_name
            set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
            if set -q branch[1]
                echo (string replace -r '^refs/heads/' '' $branch)
            else
                echo (git rev-parse --short HEAD 2>/dev/null)
            end
        end

        function _is_git_dirty
            echo (git status -s --ignore-submodules=dirty 2>/dev/null)
        end

        function _is_git_repo
            type -q git
            or return 1
            git rev-parse --git-dir >/dev/null 2>&1
        end


        function _repo_branch_name
            _$argv[1]_branch_name
        end

        function _is_repo_dirty
            _is_$argv[1]_dirty
        end

        function _repo_type
            if _is_git_repo
                echo 'git'
                return 0
            end
            return 1
        end
    end

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
    if test "$USER" = 'root'
        set arrow " $arrow_color#"
    end

    set -l cwd $green(prompt_pwd)

    if set -l repo_type (_repo_type)
        set -l repo_branch (_repo_branch_name $repo_type)
        set repo_info " $normal($repo_branch"

        set -l dirty (_is_repo_dirty $repo_type)
        if test -n "$dirty"
            set -l dirty "$yellow ✗"
            set repo_info "$repo_info$dirty$normal)"
        else 
            set repo_info "$repo_info$normal)"
        end
    end

    echo -n -s $cwd $repo_info $normal $arrow ' '

    set lista "htop" "ef" "en" "el" "nvim" "lfcd" "l" "less" "zoom" "calc" "sc" "sd" "qalc"
    set otra (string split ' ' $history[1])
    set -l hacer true
    if test $CMD_DURATION -gt (math "1000 * 10")
        for i in $otra 
            if contains -- $i $lista
                set hacer false
                break
            end
        end
        if $hacer
            set secs (math --scale=1  "$CMD_DURATION / 1000")
            if test $secs -gt 3600
                    set hrs (math --scale=1  "$secs / 3600")
                    notify-send "$history[1]" "le llevó $hrs horas"
            else if test $secs -ge 60
                    set mins (math --scale=1 "$secs / 60")
                    notify-send "$history[1]" "llevó $mins minutos"
            else if test $secs -lt 60
                    notify-send "$history[1]" "llevó $secs segundos"
            end
        set -u CMD_DURATION 0
        end
    end
end
        # if $hacer
        #    set secs (math "$CMD_DURATION / 1000")
        #    if test $secs -gt 60
        #        set mins (math "$secs / 60")
        #        if test $mins -gt 60
        #            set hrs (math "$secs / 60")
        #            notify-send "$history[1]" "devolvio $status, le llevó $hrs horas"
        #        end
        #        notify-send "$history[1]" "devolvio $status, le llevó $mins minutos"
        #        break
        #    end
        #    notify-send "$history[1]" "devolvio $status, le llevó $secs segundos"
        #    set -u CMD_DURATION 0
        # end
