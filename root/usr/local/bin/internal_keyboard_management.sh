#!/bin/bash

export DISPLAY=":0"
export XAUTHORITY="/home/`users`/.Xauthority"

invocation="$0"
target_keyboard="AT Translated Set 2 keyboard"

function usage {
    echo "This script let you quickly manage the state of the keyboard $target_keyboard"
    echo "Usage: $invocation [enable|disable|help]"
    echo -e "\tNo argument = toggle"
    exit $1
}

function toggle {
    if `xinput list "$target_keyboard" | grep -i --quiet disable`; then
        xinput enable "$target_keyboard"
    else
        xinput disable "$target_keyboard"
    fi
}

if [[ -n $1 ]]; then
    case $1 in
        "enable")
        echo "script enable -" >> /tmp/script.log
        xinput enable "$target_keyboard"
        ;;
    "disable")
        echo "script disable -" >> /tmp/script.log
        xinput disable "$target_keyboard"
        ;;
    "help")
        echo "script help -" >> /tmp/script.log
        usage 0
        ;;
    *)
        echo "Invalid option"
        echo "script error -" >> /tmp/script.log
        usage 1
        ;;
    esac
else
    echo "script toggle -" >> /tmp/script.log
    toggle
fi
