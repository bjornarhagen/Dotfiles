#!/bin/bash

currentSink=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
currentVolume=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $currentSink + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )

if [ "$1" == "-s" ] || [ "$1" == "--set-device" ]; then
	if [ ! -z "$2" ]; then
		pactl list short sink-inputs | while read stream; do
			streamId=$(echo $stream|cut '-d ' -f1)
			newSink="$2"

			notify-send "Audio device changed" "Changed to $newSink"

			pactl move-sink-input "$streamId" "$newSink"
			pactl set-default-sink "$newSink"
			pactl set-sink-volume "$newSink" 0
		done
	fi
fi

if [ "$1" == "-c" ] || [ "$1" == "--change-volume" ]; then
	if [ ! -z "$2" ]; then
		pactl set-sink-volume "$currentSink" "$2";

		ID=$(cat $HOME/.config/dunst/.volume)
		dunsify -p "$ID"

		if [[ $ID -gt "0" ]]; then
			dunstify -p -r $ID "Volume: $currentVolume" > $HOME/.config/dunst/.volume
		else
			dunstify -p "Volume: $currentVolume" > $HOME/.config/dunst/.volume
		fi
	fi
fi

if [ -z "$1" ]; then
	echo "Argument required"

	echo "Usage: $0 <sinkId/sinkName>" >&2
	echo "Valid sinks:" >&2
	pactl list short sinks | while read sink; do
		echo "$sink" >&2
	done
	exit 1
fi
