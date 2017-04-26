cite about-plugin
about-plugin 'enable groovy'

# groovy
if [ -d "/opt/groovy" ]; then
  export GROOVY_HOME="/opt/groovy"
  export PATH="$PATH:$GROOVY_HOME/bin"
fi

