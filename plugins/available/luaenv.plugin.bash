# Load rbebv, if you are using it

cite about-plugin
about-plugin 'load luaenv, if you are using it'

pathmunge "$HOME"/.luaenv/bin
[ -x `which luaenv` ] && eval "$(luaenv init -)"

[ -d "$HOME"/.luaenv/plugins/lua-build ] && pathmunge "$HOME"/.luaenv/plugins/lua-build/bin
