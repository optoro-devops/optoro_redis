#
# Cookbook Name:: optoro-redis
# Recipe:: default
#
# Copyright (C) 2014 Optoro Inc
#
# All rights reserved - Do Not Redistribute

# Install and enable redis server based on default attributes
#include_recipe "redisio::install"
#include_recipe "redisio::enable"

# TODO: Probably want to use a search here to look for
# other redis instances.
#
if node[:redisio][:servers].count == 0
  # Setup master redis instance
  include_recipe "optoro-redis::master"
else
  include_recipe "optoro-redis::replication_client"
end
