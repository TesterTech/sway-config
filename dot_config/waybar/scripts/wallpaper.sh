#!/bin/bash

#export PATH="${PATH}:${HOME}/.local/bin/"

DIR=$HOME/Pictures/Wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

echo ">> ${RANDOMPICS}"

if [[ $(pidof swww) ]]; then
  pkill swww
fi

# swww init
# For Fedora copr:copr.fedorainfracloud.org:alebastr:sway-extras   Copr repo for sway-extras owned by alebastr
echo ">> swww ${DIR}/${RANDOMPICS} "
swww img ${DIR}/${RANDOMPICS} --transition-type grow --transition-fps 60 --transition-duration 0.5 --transition-pos 0.810,0.972 --transition-bezier 0.65,0,0.35,1 --transition-step 255

echo "[script: wallpaper.sh]>> Go call the pywal.sh script for ${DIR}/${RANDOMPICS} with --cols16 "
source ${HOME}/scripts/pywal.sh "${DIR}/${RANDOMPICS}" --cols16

sleep 1s
echo ">> Update the fox"
pywalfox update

