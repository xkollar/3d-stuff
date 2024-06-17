#!/usr/bin/env bash

set -eu

readonly x=${1?X}
readonly y=${2?Y}
readonly r=${3?R}
readonly d=${4?D}

exec awk \
    --assign="X=${x}" \
    --assign="Y=${y}" \
    --assign="R=${r}" \
    --assign="D=${d}" \
    '/vertex/{f=1+D/(1+(1/R)*(($2-X)**2+($3-Y)**2));$2=$2*f;$3=$3*f}{print}'
