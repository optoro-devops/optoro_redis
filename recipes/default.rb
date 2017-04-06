#
# Cookbook Name:: optoro-redis
# Recipe:: default
#
# Copyright (C) 2014 Optoro Inc
#
# All rights reserved - Do Not Redistribute

# Install and enable redis server based on default attributes

if node['redisio']['version'].to_f >= 3.2
  node.override['redisio']['default_settings']['protected_mode'] = 'no'
end

include_recipe 'optoro_redis::create_redis_user'
include_recipe 'optoro_redis::create_data_directory'
include_recipe 'optoro_redis::consul'
include_recipe 'optoro_redis::redis_exporter'
include_recipe 'redisio'
include_recipe 'redisio::install'
include_recipe 'redisio::enable'
