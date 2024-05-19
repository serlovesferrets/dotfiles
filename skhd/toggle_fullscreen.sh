# Toggles full screen mode

if [ -f /tmp/twmconf ]; then
    source /tmp/twmconf
else
    echo "GAPS_TOGGLED=true" > /tmp/twmconf
    GAPS_TOGGLED=true
fi

yabai -m space --toggle padding
yabai -m space --toggle gap

if [ "$GAPS_TOGGLED" = "true" ]; then
    yabai -m config external_bar off:0:0
    sketchybar --bar hidden=true
    GAPS_TOGGLED=false
else
    yabai -m config external_bar all:32:0
	sketchybar --bar hidden=false
    GAPS_TOGGLED=true
fi

echo "GAPS_TOGGLED=$GAPS_TOGGLED" > /tmp/twmconf
