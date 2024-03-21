#!/bin/bash

temp_screenshot="/tmp/screenshot.png"

function print_error
{
cat << "EOF"
    ./screenshot.sh <action>
    ...valid actions are...
        p : print all screens
        w : print active window
        sf : snip current screen (frozen)
        m : print focused monitor
EOF
}

case $1 in
p)  # print all outputs
    grimblast save screen $temp_screenshot && swappy -f $temp_screenshot ;;
w)  # print active window
    grimblast save active $temp_screenshot && swappy -f $temp_screenshot ;;
sf) # frozen screen, drag to manually snip an area / click on a window to print it
    grimblast --freeze save area $temp_screenshot && swappy -f $temp_screenshot ;;
m)  # print focused monitor
    grimblast save output $temp_screenshot && swappy -f $temp_screenshot ;;
*)  # invalid option
    print_error ;;
esac

# case $1 in
# p)  # print all outputs
#     grimblast save screen - | swappy -f - ;;
# w)  # print active window
#     grimblast save active - | swappy -f - ;;
# sf) # frozen screen, drag to manually snip an area / click on a window to print it
#     grimblast --freeze save area - | swappy -f - ;;
#     # grimblast save area - | swappy -f - ;;
# m)  # print focused monitor
#     grimblast save output - | swappy -f - ;;
# *)  # invalid option
#     print_error ;;
# esac

rm "$temp_screenshot"

