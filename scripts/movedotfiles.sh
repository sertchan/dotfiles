#!/bin/bash

dotfiles=(
	"alacritty"
	"btop"
	"hypr"
	"mako" 
	"mpv"
	"nvim"
	"paru"
	"ranger"
	"scripts"
	"starship.toml"
	"tmux"
	"waybar"
	"wofi"
)

for ((i=0; i<${#dotfiles[@]}; i++)); do
  directory="${dotfiles[$i]}"
  mv ~/.config/$directory ~/Repos/dotfiles/
  ln -s ~/Repos/dotfiles/$directory ~/.config/
  echo "$directory done."
done
