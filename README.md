# Dotfiles
My Current Tech Stack
- Arch Linux
- Waybar
- Polybar
- Rofi
- Alacritty
- Bash
- Neovim
- Dunst + SwayNC

Feel free to use these configs as you see fit, this repo is mostly for me to save my own files between machines.
The perculair folder setup is because I use GNU Stow to manage my dotfiles.
Also my Bash Prompt has that smiley face script :)

Sleep stuff:
`https://gist.github.com/Raymo111/91ffd256b7aca6a85e8a99d6331d3b7b
and here https://wiki.archlinux.org/title/Power_management#Sleep_hooks
this is not included as files in this repo but explination so I have it written down. I have a apci event set to 
suspend when the lid is closed, and a systemd runner set to run a i3 lock script when it resumes from a suspend 
