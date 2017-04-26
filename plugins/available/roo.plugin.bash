cite about-plugin
about-plugin 'enable roo'

# roo
if [ -d "/opt/roo" ]; then
  export ROO_HOME="/opt/roo"
  export PATH="$PATH:$ROO_HOME/bin"
fi

