(xbindkey '(XF86AudioRaiseVolume) "pactl set-sink-volume 0 -- '+5%'")
(xbindkey '(XF86AudioLowerVolume) "pactl set-sink-volume 0 -- '-5%'")
(xbindkey '(XF86AudioMute) "pactl set-sink-volume 0 0")

(xbindkey '(XF86AudioPlay) "mpc toggle")
(xbindkey '(XF86AudioNext) "mpc next")
(xbindkey '(XF86AudioPrev) "mpc prev")

(xbindkey '(mod4 F10) "mpc prev")
(xbindkey '(mod4 F11) "mpc toggle")
(xbindkey '(mod4 mod1 F11) "music-chose")
(xbindkey '(mod4 F12) "mpc next")

(xbindkey '(XF86MonBrightnessUp) "xbacklight -inc 5")
(xbindkey '(XF86MonBrightnessDown) "xbacklight -dec 5")

(xbindkey '(XF86Eject) "eject /dev/cdrom")
