#!/bin/bash
# ~/.config/hypr/hyprlock/Scripts/songdetail.sh
PATH=$PATH:/usr/local/bin:/usr/bin
export PATH

if command -v playerctl &> /dev/null; then
    if playerctl status &> /dev/null; then
        artist=$(playerctl metadata artist 2>/dev/null)
        title=$(playerctl metadata title 2>/dev/null)
        player=$(playerctl metadata --format "{{ playerName }}" 2>/dev/null)
        platform=$(playerctl metadata xesam:url | cut -d '.' -f 2 2>/dev/null) 
        

        #Icon
        if [[ -n "$platform" ]]; then
            if [[ "$platform" = "youtube" ]]; then
                player_icon="\t"
            elif [[ "$platform" = "spotify" ]]; then
                player_icon="\t"
            else
                player_icon="󰎇\t"
            fi
        fi

        #Output
        if [[ -n "$artist" && -n "$title" && -n "$platform" ]]; then
             echo -e "$player_icon $artist - $title"
        elif [[ -n "$title" ]]; then
            echo -e "$player_icon $title"
        else
            echo -e "$player_icon Music Playing"
        fi
    else
        echo ""
    fi
else
    echo ""
fi