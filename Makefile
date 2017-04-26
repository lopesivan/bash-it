PLUGINS_ENV_PYTHON = pyenv python
PLUGINS_ENV_RUBY   = rbenv ruby
PLUGINS_ENV_CARGO  = cabal pandoc
PLUGINS_ENV_JAVA   = jenv android gradle groovy scala sbt roo
PLUGINS_ENV_RUST   = rustup
PLUGINS_ENV_LUA    = luaenv
PLUGINS_ENV_NODE   = ndenv
PLUGINS_ENV_PERL   = plenv
PLUGINS_ENV_TMUX   = tmuxinator tmux
PLUGINS_ENV_DOCKER = docker

COMPLETIONS_ENV_PYTHON = pip
COMPLETIONS_ENV_RUBY   = gem
COMPLETIONS_ENV_JAVA   = gradle spring
COMPLETIONS_ENV_NODE   = grunt bundler
COMPLETIONS_ENV_GIT    = git_flow git
COMPLETIONS_ENV_DOCKER = docker docker-compose kitchen
COMPLETIONS_ENV_TMUX   = tmuxinator

PLUGINS =\
alias-completion \
bangsh           \
dirs             \
extract          \
fzf              \
git              \
projects

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

ALIASES = developer

ENABLE_BASIC =\
enable-aliases           \
enable-plugins           \
enable-plugin-docker     \
enable-plugin-tmux       \
enable-plugin-python     \
enable-plugin-node       \
enable-plugin-ruby       \
enable-completions       \
enable-completion-tmux   \
enable-completion-git    \
enable-completion-docker \
enable-completion-python \
enable-completion-node   \
enable-completion-ruby

DISABLE_BASIC =\
disable-aliases           \
disable-plugins           \
disable-plugin-docker     \
disable-plugin-tmux       \
disable-plugin-python     \
disable-plugin-node       \
disable-plugin-ruby       \
disable-completions       \
disable-completion-tmux   \
disable-completion-git    \
disable-completion-docker \
disable-completion-python \
disable-completion-node   \
disable-completion-ruby

ENABLE_FULL =\
$(ENABLE_BASIC)          \
enable-plugin-python     \
enable-plugin-ruby       \
enable-plugin-java       \
enable-plugin-node       \
enable-plugin-cargo      \
enable-plugin-rust       \
enable-plugin-lua        \
enable-plugin-perl       \
enable-completion-python \
enable-completion-ruby   \
enable-completion-java   \
enable-completion-node

DISABLE_FULL =\
$(DISABLE_BASIC)         \
disable-plugin-python    \
disable-plugin-ruby      \
disable-plugin-java      \
disable-plugin-node      \
disable-plugin-cargo     \
disable-plugin-rust      \
disable-plugin-lua       \
disable-plugin-perl      \
disable-completion-python\
disable-completion-ruby  \
disable-completion-java  \
disable-completion-node

ENABLE_JAVA    = $(ENABLE_BASIC)  enable-plugin-java enable-completion-java
DISABLE_JAVA   = $(DISABLE_BASIC) disable-plugin-java disable-completion-java

ENABLE_CARGO   = $(ENABLE_BASIC)  enable-plugin-cargo
DISABLE_CARGO  = $(DISABLE_BASIC) disable-plugin-cargo

ENABLE_RUST    = $(ENABLE_BASIC)  enable-plugin-rust
DISABLE_RUST   = $(DISABLE_BASIC) disable-plugin-rust

ENABLE_LUA     = $(ENABLE_BASIC)  enable-plugin-lua
DISABLE_LUA    = $(DISABLE_BASIC) disable-plugin-lua

ENABLE_PERL    = $(ENABLE_BASIC)  enable-plugin-perl
DISABLE_PERL   = $(DISABLE_BASIC) disable-plugin-perl

all: enable

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

enable        : $(ENABLE_BASIC)
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
clean         : disable-full
