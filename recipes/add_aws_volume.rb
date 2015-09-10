#<
# This recipe creates an aws volume for the redis data directory
#>

# Attach redis data dir volume
include_recipe 'aws'

# TODO: Move redis to a different location and remove /var/optoro
directory '/var/optoro' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/optoro/redis' do
  owner 'redis'
  group 'redis'
  mode '0755'
  action :create
end

aws_ebs_volume 'redis_ebs_volume' do
  size 40
  device '/dev/sdf'
  action [:create, :attach]
end

# create a filesystem
execute 'mkfs' do
  command 'mkfs -t ext4 /dev/xvdf'
  not_if 'mountpoint /var/optoro/redis'
end

directory '/var/optoro/redis' do
  owner 'redis'
  group 'redis'
  mode '0755'
  action :create
end

mount '/var/optoro/redis' do
  device '/dev/xvdf'
  fstype 'ext4'
  options 'noatime,nobootwait'
  action [:enable, :mount]
  not_if 'mountpoint /var/optoro/redis'
end

node.set['redisio']['default_settings']['datadir'] = '/var/optoro/redis'
