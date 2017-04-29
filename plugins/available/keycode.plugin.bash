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

## Caps Lock virando grave

# apago o Caps Lock
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = grave acute dead_grave'
# <Caps Lock>        : `
# <shift><Caps Lock> : ´

## Caps Lock virando grave e dead_grave
#xmodmap -e 'keycode 66 = grave'  # `
#xmodmap -e 'keycode 66 = dead_acute'  # `
## <Caps Lock> retorna grave
## <shift><Caps Lock> retorna retorna dead_grave

# botões especiais
# ================

#_____________________________________________________________________-
# [carta] [Home] [msn] [Fone] <1,2,3,4,5,*> [>/||] [|<<] [>>|] [#]
# <ESC>  [F1]  .......................................    [F12]
# [papel]
# [foto]      Teclado
# [lupa+]
# [lupa]
#_____________________________________________________________________-

# [papel]
# keycode 243 (keysym 0x1008ff5b, XF86Documents)
#xmodmap -e 'keycode 243 = acute grave dead_grave'
