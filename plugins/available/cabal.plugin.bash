cite about-plugin
about-plugin 'Load cabal Development Kit Manager'
# cabal
if [ -d "$HOME/.cabal/bin" ]; then
v=23.0.1
  export PATH=$HOME/.cabal/bin:$PATH
fi
