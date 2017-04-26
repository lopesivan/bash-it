cite about-plugin
about-plugin 'enable sbt'

# sbt
if [ -d "/opt/sbt" ]; then
  export SBT_HOME="/opt/sbt"
  export PATH="$PATH:$SBT_HOME/bin"
fi

