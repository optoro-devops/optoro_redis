# Create data directory for redis files
directories = node['optoro_redis']['datadir'].split(::File::SEPARATOR)
data_directory = '/'
directories.shift
directories.each do |dir|
  data_directory = ::File.join(data_directory, dir)
  next if ::Dir.exist?(data_directory)
  directory data_directory do
    owner 'redis'
    group 'redis'
    mode '0755'
    action :create
  end
end
node.set['redisio']['default_settings']['datadir'] = node['optoro_redis']['datadir']
