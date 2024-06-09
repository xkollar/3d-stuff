#!/usr/bin/env bash

convert frame*.png -scale 800x +quantize -colors 32 -type Palette -fuzz 2% -layers Optimize animation.gif
