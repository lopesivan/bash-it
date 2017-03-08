# plugin for npandoc

cite about-plugin
about-plugin 'pandoc plugin for node'

if [[ `which pandoc` ]] ; then

  # init pandoc
  eval "$(pandoc --bash-completion)"

fi
