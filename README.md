# Description

Installs/Configures redis servers

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

* redisio (~> 2.2.4)
* optoro_monit
* aws

# Attributes

* `node['redisio']['version']` -  Defaults to `2.8.14`.
* `node['optoro_redis']['download_url']` -  Defaults to `http://download.redis.io/releases/redis-2.8.14.tar.gz`.
* `node['redisio']['servers']` -  Defaults to `[ ... ]`.

# Recipes

* [optoro_redis::add_aws_volume](#optoro_redisadd_aws_volume)
* optoro_redis::default
* optoro_redis::test

## optoro_redis::add_aws_volume

This recipe creates an aws volume for the redis data directory

# License and Maintainer

Maintainer:: Optoro (<devops@optoro.com>)

License:: MIT
