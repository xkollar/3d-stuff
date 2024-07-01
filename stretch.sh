#!/usr/bin/env bash

set -eu

x=0
y=0
r=1
d=0.5

args=()

while [[ ${#} -ne 0 ]]; do
    opt=${1}; shift
    case "${opt}" in
        -x) x=${1?VALUE}; shift;;
        -y) y=${1?VALUE}; shift;;
        -r) r=${1?VALUE}; shift;;
        -d) d=${1?VALUE}; shift;;
        --) break;;
        -*) echo "Unknown arg: ${opt}"; exit 1;;
        *) args=( "${opt}" "${@}" )
    esac
done

exec awk \
    --assign="X=${x}" \
    --assign="Y=${y}" \
    --assign="R=${r}" \
    --assign="D=${d}" \
    -- \
    '/vertex/{f=D/(1+(1/R)*(($2-X)**2+($3-Y)**2));$2=$2+($2-X)*f;$3=$3+($3-Y)*f}{print}' \
    "${args[@]}"
