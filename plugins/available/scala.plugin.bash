cite about-plugin
about-plugin 'enable scala'

# scala
if [ -d "/opt/scala" ]; then
  export SCALA_HOME="/opt/scala"
  export PATH="$PATH:$SCALA_HOME/bin"
fi

