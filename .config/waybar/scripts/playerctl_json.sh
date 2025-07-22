#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
    echo '{"text": "", "tooltip": "No active player", "class": "inactive"}'
    exit 0
fi

formatPlayerInfo() {
  text="$2 - $3"
  if [ ${#text} -gt 30 ]; then
    text="$3"
  fi
  case "$1" in
    spotify) 
      icon=""
      class="$1$4"
      ;;  
    firefox) 
      icon=""
      class="$1$4"
      ;;  
    *)       
      icon="🎵" 
      class="other$4"
      ;;
  esac
   echo "{\"text\": \"$icon $text\", \"tooltip\": \"$1\", \"class\": \"$class\"}"
}

playerctl -F -a metadata --format '{{playerName}}|{{artist}}|{{markup_escape(title)}}|{{status}}' | while IFS="|" read -r pname artist title status; do
  formatPlayerInfo "$pname" "$artist" "$title" "$status"
done




