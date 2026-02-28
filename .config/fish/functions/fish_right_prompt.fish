function fish_right_prompt
    if test $CMD_DURATION
        # Convert milliseconds to seconds and format to 3 decimal places
        set duration (math --scale=3 "$CMD_DURATION / 1000")
        echo "("(date -d"@$duration" -u +"%M:%S")")"
    end
end
