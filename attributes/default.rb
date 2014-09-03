# Default attributes file
# cookbook: optoro-redis

default[:redisio][:version] = '2.8.14'
default[:optoro_redis][:download_url] = "http://download.redis.io/releases/redis-2.8.14.tar.gz"
default[:redisio][:servers] = [
  { port: 6379 }
]
