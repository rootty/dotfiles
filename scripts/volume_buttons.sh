bindsym --release XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 -- +10% && killall -SIGUSR1 i3status
bindsym --release XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -- -10% && killall -SIGUSR1 i3status
