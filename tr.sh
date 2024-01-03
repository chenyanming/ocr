#!/usr/bin/env bash

set -e

case $DESKTOP_SESSION in
    sway)
        grim -g "$(slurp)" /tmp/tmp.just_random_name.png
        ;;
    plasmawayland | plasma)
        spectacle --region --nonotify --background \
            --output /tmp/tmp.just_random_name.png
        ;;
    *)
        echo "Failed to know desktop type"
        exit 1
        ;;
esac

# note that tesseract will apppend .txt to output file
#tesseract /tmp/tmp.just_random_name.png /tmp/tmp.just_random_name --psm 5 --oem 3 -l jpn
#tesseract /tmp/tmp.just_random_name.png /tmp/tmp.just_random_name --psm 5 -l jpn_vert
tesseract /tmp/tmp.just_random_name.png /tmp/tmp.just_random_name --oem 1 -l eng
cat /tmp/tmp.just_random_name.txt

#rapidocr_onnxruntime -img /tmp/tmp.just_random_name.png --no_det --no_cls | python3 -c "import sys, ast; print(ast.literal_eval(sys.stdin.read())[0][0])" > /tmp/tmp.just_random_name.txt
#cat /tmp/tmp.just_random_name.txt

#chatgpt transalate \""$(cat /tmp/tmp.just_random_name.txt)"\" to chinese

#goldendict "$(cat /tmp/tmp.just_random_name.txt)"
cat /tmp/tmp.just_random_name.txt | xclip -selection clipboard


rm /tmp/tmp.just_random_name.png
rm /tmp/tmp.just_random_name.txt
