PLUGINS =\
alias-completion \
android          \
bangsh           \
cabal            \
dirs             \
docker           \
extract          \
fzf              \
git              \
gradle           \
jenv             \
luaenv           \
ndenv            \
pandoc           \
plenv            \
projects         \
pyenv            \
python           \
rustup           \
rbenv            \
ruby             \
tmuxinator       \
tmux

COMPLETIONS =\
completion     \
template       \
tp             \
docker         \
xp             \
code           \
wd             \
pip            \
makefile       \
gradle         \
tmuxinator     \
defaults       \
redis_alias    \
git_flow       \
projects       \
gem vim        \
bash-it        \
dirs           \
bundler        \
system         \
grunt          \
git            \
docker-compose \
kitchen

ALIASES = developer

all: enable

enable : enable-plugins enable-completions enable-aliases
disable: disable-plugins disable-completions disable-aliases

disable-plugins:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS);" )
enable-plugins:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable  plugin $(PLUGINS);" )
disable-completions:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS);" )
enable-completions:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable  completion $(COMPLETIONS);" )
disable-aliases:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable alias $(ALIASES);" )
enable-aliases:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable  alias $(ALIASES);" )

clean: disable

