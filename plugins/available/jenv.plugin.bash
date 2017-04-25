cite about-plugin
about-plugin 'load jenv, if you are using it'

export JENV_ROOT="$HOME/.jenv"
pathmunge "$JENV_ROOT/bin"

if which jenv > /dev/null; then
    eval "$(jenv init -)";
    export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
    alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'
fi

[[ -e $JENV_ROOT/completions/jenv.bash ]] && source $JENV_ROOT/completions/jenv.bash
