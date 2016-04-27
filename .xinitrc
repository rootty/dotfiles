#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec i3

#exec --no-startup-id "setxkbmap -model pc105 -layout pl,ua -option grp:alt_shift_toggle"

#xrandr --output eDP1 --auto --left-of HDMI1 --primary
export XDG_CURRENT_DESKTOP=KDE
export QT_STYLE_OVERRIDE=breeze
export QT_QPA_PLATFORMTHEME="qt5ct"
