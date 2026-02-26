BACKGROUNDS=/usr/share/backgrounds/sequence
swaylock --image $BACKGROUNDS/$(shuf -i 0-$(ls -l $BACKGROUNDS | wc -l) -n 1).jpg --mode center
