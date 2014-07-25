#
# Cookbook Name:: optoro-redis
# Recipe:: default
#
# Copyright (C) 2014 Optoro Inc
#
# All rights reserved - Do Not Redistribute

# Make sure requisite packages are installed
# and ulimit resources are available
include_recipe 'redisio::default'
include_recipe 'ulimit::default'

# Find master server settings
optoro_servers = node[:optoro_redis][:servers]

# Use resource to install redis on this node.

optoro_servers.each do |redis_server|
  redisio_install "redis" do
    version node[:redisio][:version]
    download_url node[:optoro_redis][:download_url]
    servers [redis_server]
    default_settings node[:redisio][:default_settings]
  end

  service "redis#{redis_server[:name]}" do
    action [:enable, :start]
  end
end

