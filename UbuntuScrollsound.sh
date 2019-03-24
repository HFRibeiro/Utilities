sudo apt-get install xautomation xbindkeys x11-utils
gedit ~/.xbindkeysrc
"""
# use 'xev' to find key codes.
# xbindkeys for button assignments.
# xautomation (xte) for key assignments.

# b:1  -  left mouse button
# b:2  -  wheel button
# b:3  -  right mouse button
# b:4  -  mouse wheel up
# b:5  -  mouse wheel down
# b:6  -  mouse wheel left
# b:7  -  mouse wheel right
# b:8  -  back side button
# b:9  -  forward side button


# Volume Up
"amixer -D pulse sset Master 5%+" 
  b:6

# Volume Down
"amixer -D pulse sset Master 5%-" 
  b:7

"""
xbindkeys -f ~/.xbindkeysrc
