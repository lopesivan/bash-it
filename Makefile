PLUGINS_ENV_PYTHON = pyenv python
PLUGINS_ENV_RUBY   = rbenv ruby
PLUGINS_ENV_CARGO  = cabal pandoc
PLUGINS_ENV_JAVA   = jenv android gradle groovy scala sbt roo
PLUGINS_ENV_RUST   = rustup
PLUGINS_ENV_LUA    = luaenv
PLUGINS_ENV_NODE   = ndenv
PLUGINS_ENV_PERL   = plenv
PLUGINS_ENV_TMUX   = tmuxinator tmux kill
PLUGINS_ENV_DOCKER = docker

COMPLETIONS_ENV_PYTHON = pip
COMPLETIONS_ENV_RUBY   = gem
COMPLETIONS_ENV_JAVA   = gradle spring
COMPLETIONS_ENV_NODE   = grunt bundler
COMPLETIONS_ENV_GIT    = git_flow git
COMPLETIONS_ENV_DOCKER = docker docker-compose kitchen
COMPLETIONS_ENV_TMUX   = tmuxinator kill

PLUGINS =\
alias-completion \
cursorblue       \
keycode          \
bangsh           \
dirs             \
extract          \
fzf              \
git              \
projects

#cursorred       \

COMPLETIONS =\
completion     \
template       \
tp             \
xp             \
code           \
wd             \
makefile       \
defaults       \
redis_alias    \
projects       \
vim            \
bash-it        \
dirs           \
system

ALIASES = developer xclip vim redis mutt

ON =       \
enable-{aliases,plugins,completions} \
enable-plugin-{docker,tmux,python,node,ruby} \
enable-completion-{tmux,git,docker,python,node,ruby}

OFF =      \
disable-{aliases,plugins,completions} \
disable-plugin-{docker,tmux,python,node,ruby} \
disable-completion-{tmux,git,docker,python,node,ruby}

FULL_ON =  \
enable-plugin-{python,ruby,java,node,cargo,rust,lua,perl} \
enable-completion-{python,ruby,java,node}

FULL_OFF = \
disable-plugin-{python,ruby,java,node,cargo,rust,lua,perl} \
disable-completion-{python,ruby,java,node}

ENABLE_BASIC  = $(shell bash -c "echo $(ON)")
DISABLE_BASIC = $(shell bash -c "echo $(OFF)")
ENABLE_FULL   = $(ENABLE_BASIC) $(shell bash -c "echo $(FULL_ON)")
DISABLE_FULL  = $(DISABLE_BASIC) $(shell bash -c "echo $(FULL_OFF)")

ENABLE_JAVA   = $(ENABLE_BASIC)  enable-plugin-java enable-completion-java
DISABLE_JAVA  = $(DISABLE_BASIC) disable-plugin-java disable-completion-java

ENABLE_CARGO  = $(ENABLE_BASIC)  enable-plugin-cargo
DISABLE_CARGO = $(DISABLE_BASIC) disable-plugin-cargo

ENABLE_RUST   = $(ENABLE_BASIC)  enable-plugin-rust
DISABLE_RUST  = $(DISABLE_BASIC) disable-plugin-rust

ENABLE_LUA    = $(ENABLE_BASIC)  enable-plugin-lua
DISABLE_LUA   = $(DISABLE_BASIC) disable-plugin-lua

ENABLE_PERL   = $(ENABLE_BASIC)  enable-plugin-perl
DISABLE_PERL  = $(DISABLE_BASIC) disable-plugin-perl

all: enable
status:
	@ls -hF --color=tty */enabled/*

# basic
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

# languages enables
enable-plugin-python:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_PYTHON);" )
enable-plugin-ruby:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_RUBY);" )
enable-plugin-cargo:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_CARGO);" )
enable-plugin-java:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_JAVA);" )
enable-plugin-rust:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_RUST);" )
enable-plugin-lua:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_LUA);" )
enable-plugin-node:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_NODE);" )
enable-plugin-perl:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_PERL);" )
enable-plugin-tmux:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_TMUX);" )
enable-plugin-docker:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable plugin $(PLUGINS_ENV_DOCKER);" )

# languages disables
disable-plugin-python:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_PYTHON);" )
disable-plugin-ruby:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_RUBY);" )
disable-plugin-cargo:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_CARGO);" )
disable-plugin-java:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_JAVA);" )
disable-plugin-rust:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_RUST);" )
disable-plugin-lua:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_LUA);" )
disable-plugin-node:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_NODE);" )
disable-plugin-perl:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_PERL);" )
disable-plugin-tmux:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_TMUX);" )
disable-plugin-docker:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable plugin $(PLUGINS_ENV_DOCKER);" )

# languages disables
disable-completion-python:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS_ENV_PYTHON);" )
disable-completion-ruby:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS_ENV_RUBY);" )
disable-completion-java:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS_ENV_JAVA);" )
disable-completion-node:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS_ENV_NODE);" )
disable-completion-git:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS_ENV_GIT);" )
disable-completion-docker:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS_ENV_DOCKER);" )
disable-completion-tmux:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it disable completion $(COMPLETIONS_ENV_TMUX);" )

# languages enables
enable-completion-python:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable completion $(COMPLETIONS_ENV_PYTHON);" )
enable-completion-ruby:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable completion $(COMPLETIONS_ENV_RUBY);" )
enable-completion-java:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable completion $(COMPLETIONS_ENV_JAVA);" )
enable-completion-node:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable completion $(COMPLETIONS_ENV_NODE);" )
enable-completion-git:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable completion $(COMPLETIONS_ENV_GIT);" )
enable-completion-docker:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable completion $(COMPLETIONS_ENV_DOCKER);" )
enable-completion-tmux:
	(bash -c "source ${HOME}/developer/bash-config/it.sh; unset BASH_IT_THEME; unset GIT_HOSTING; unset NGINX_PATH; unset IRC_CLIENT; unset TODO; unset SCM_CHECK; bash-it enable completion $(COMPLETIONS_ENV_TMUX);" )

disable       : $(DISABLE_BASIC)
enable-full   : $(ENABLE_FULL)
disable-full  : $(DISABLE_FULL)
enable-java   : $(ENABLE_JAVA)
disable-java  : $(DISABLE_JAVA)
enable-cargo  : $(ENABLE_CARGO)
disable-cargo : $(DISABLE_CARGO)
enable-rust   : $(ENABLE_RUST)
disable-rust  : $(DISABLE_RUST)
enable-lua    : $(ENABLE_LUA)
disable-lua   : $(DISABLE_LUA)
enable-perl   : $(ENABLE_PERL)
disable-perl  : $(DISABLE_PERL)

##############################################################################
##############################################################################
##############################################################################

enable: $(ENABLE_BASIC) cargo
cargo : enable-cargo
lua   : enable-lua
rust  : enable-rust
perl  : enable-perl
full  : enable-full
java  : enable-java
clean : disable-full
