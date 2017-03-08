cite about-plugin
about-plugin 'Add a gw command to use gradle wrapper if present, else use system gradle'

# gradle
if [ -d "/opt/gradle" ]; then
  export GRADLE_HOME="/opt/gradle"
  export PATH="$PATH:$GRADLE_HOME/bin"
fi

function gw() {
  local file="gradlew"
  local curr_path="${PWD}"
  local result="gradle"

  # Search recursively upwards for file.
  until [[ "${curr_path}" == "/" ]]; do
    if [[ -e "${curr_path}/${file}" ]]; then
      result="${curr_path}/${file}"
      break
    else
      curr_path=$(dirname "${curr_path}")
    fi
  done

  # Call gradle
  "${result}" $*
}

