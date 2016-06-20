#<
# This recipe creates an aws volume for the redis data directory
#>

# Attach redis data dir volume
include_recipe 'aws'
data_directory = node['optoro_redis']['datadir']

aws_ebs_volume 'redis_ebs_volume' do
  size 40
  device '/dev/sdf'
  action [:create, :attach]
end

# create a filesystem
execute 'mkfs' do
  command 'mkfs -t ext4 /dev/xvdf'
  not_if "mountpoint #{data_directory}"
end

directory data_directory do
  owner 'redis'
  group 'redis'
  mode '0755'
  action :create
end

mount data_directory do
  device '/dev/xvdf'
  fstype 'ext4'
  options 'noatime,nobootwait'
  action [:enable, :mount]
  not_if "mountpoint #{data_directory}"
end
