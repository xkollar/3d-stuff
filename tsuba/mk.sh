cat ascii-cnt.stl \
    | awk '/vertex/{$4=$4*(0.3+0.7/(1+0.005*$2**2))}{print}' \
    | ../stretch.sh -x 0 -y -2 -r 0.4 -d 5 \
    | ../stretch.sh -y 2 -r 1 -d 10 \
    > ascii-cnt-2.stl
