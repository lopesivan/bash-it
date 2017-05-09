cite about-plugin
about-plugin 'Load Android Development Kit Manager'

# android
# android update sdk --no-ui
if [ -d "/opt/android-sdk-linux" ]; then
v=23.0.1
  export ANDROID_HOME=/opt/android-sdk-linux
  export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/tools
  export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/platform-tools
  export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/build-tools/${v}
fi

if [ -d "/opt/apktools" ]; then
v=23.0.1
  export PATH=$PATH:/opt/apktools
fi

# if [ -d "/opt/android-sdk-linux_x86-1.6_r1" ]; then
# v=23.0.1
#   export ANDROID_HOME=/opt/android-sdk-linux_x86-1.6_r1
#   export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/tools
#   export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/platform-tools
#   export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/build-tools/${v}
# fi

