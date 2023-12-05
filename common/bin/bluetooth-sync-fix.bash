#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset -o pipefail

bluez_card="$(pactl list cards short | grep --only-matching 'bluez_card[^[:space:]]*')"
pactl set-card-profile "$bluez_card" a2dp_sink
pactl set-card-profile "$bluez_card" headset_head_unit
pactl set-card-profile "$bluez_card" a2dp_sink
