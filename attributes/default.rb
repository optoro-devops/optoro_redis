# Default attributes file
# cookbook: optoro-redis

default[:redisio][:version] = '2.8.9'
default[:optoro_redis][:download_url] = "http://download.redis.io/releases/redis-2.8.9.tar.gz"
default[:optoro_redis][:servers] = [
  { name: "Master", port: 6379 }
]
