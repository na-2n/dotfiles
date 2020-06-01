#!/bin/bash

OUTFILE="/tmp/_rec.mp4"
FRAMERATE=30
VIDEO_CODEC="h264_nvenc"
UPLOAD_CMD="owo"

read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i" -q)

ffmpeg -y -f x11grab -show_region 1 -framerate $FRAMERATE \
    -draw_mouse 1 \
    -s "${W}x${H}" -i "${DISPLAY}.0+${X},${Y}" -codec:v $VIDEO_CODEC \
    $OUTFILE

$UPLOAD_CMD $OUTFILE
