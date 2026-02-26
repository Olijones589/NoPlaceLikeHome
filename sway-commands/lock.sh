BACKGROUNDS=/usr/share/backgrounds/sequence
swaylock \
	--image $(find $BACKGROUNDS -maxdepth 1 -type f -print0 | shuf -z -n 1)
