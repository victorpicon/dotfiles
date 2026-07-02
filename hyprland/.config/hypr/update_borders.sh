#!/bin/bash
# Espera o arquivo do wal ser atualizado, caso precise de um milissegundo
sleep 0.1
(
  echo "\$color1 = rgb($(sed -n '2p' ~/.cache/wal/colors | sed 's/#//'))"
  echo "\$color2 = rgb($(sed -n '5p' ~/.cache/wal/colors | sed 's/#//'))"
) > ~/.cache/wal/colors-hyprland.conf
hyprctl reload
