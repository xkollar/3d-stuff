#!/usr/bin/env bash

convert frame*.png -scale 800x +quantize -colors 32 -type Palette -fuzz 2% -layers Optimize -delay 1 animation.gif

ffmpeg -r 10 -f image2 -i 'frame%005d.png' -vf scale=800x600,fps=10 -crf 0 -pix_fmt yuv420p animation.webm
