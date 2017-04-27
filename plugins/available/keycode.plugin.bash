cite about-plugin
about-plugin 'Caps Lock virando grave'

# Use xev para ver keycode ...
# ----------------------------------------------------------------------------
# dead + _ + key => key + space
# xmodmap -e 'eycode 194  = dead_grave'

# 1 2 [3] 4 5
#xmodmap -e 'keycode 194  = grave'       # `

# 1 2 3 [4] 5
#xmodmap -e 'keycode 195  = asciitilde '       # ~

# 1 2 3 4 [5]
#xmodmap -e 'keycode 196  = asciicircum'  # ^

# Caps Lock virando grave
#xmodmap -e 'keycode 66 = grave'  # `
xmodmap -e 'keycode 66 ='

# <Caps Lock> retorna grave
# <shift><Caps Lock> retorna toogle Caps Lock

