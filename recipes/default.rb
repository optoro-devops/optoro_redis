#
# Cookbook Name:: optoro-redis
# Recipe:: default
#
# Copyright (C) 2014 Optoro Inc
#
# All rights reserved - Do Not Redistribute

# Install and enable redis server based on default attributes
include_recipe 'redisio'
include_recipe 'redisio::install'
include_recipe 'redisio::enable'
