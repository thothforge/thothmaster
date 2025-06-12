#!/usr/bin/env nu

# Show a progress bar
export def show-progress-bar [steps: int] {
    for i in 1..$steps {
        # Clear the line and show progress
        print -n "\r["
        for j in 1..$i {
            print -n "="
        }
        for j in 1..($steps - $i) {
            print -n " "
        }
        print -n $"] (($i * 100 / $steps))%"
        sleep 100ms
    }
    print ""  # New line after progress bar
}

