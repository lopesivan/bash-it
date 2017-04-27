cite 'about-alias'
about-alias 'redis aliases'

_redis_list(){
	redis-cli ZRANGE $1 0 -1
}
_redis_zram(){
	db=$1
	shift
	redis-cli zadd $db 1 $1
}

alias redis.list='_redis_list'
alias redis.keys='redis-cli KEYS \*'
alias redis.get='redis-bash-cli get'
alias redis.set='redis-bash-cli set'
alias redis.del='redis-bash-cli del'
alias redis.zadd='_redis_zram'
alias last.list='redis-cli ZRANGE vimmru 0 -1'
alias last.del='redis-cli DEL vimmru'
alias uff='EMAILBOX=uff mutt'
alias ufrj='EMAILBOX=ufrj mutt'

# vi:set nu nowrap:
