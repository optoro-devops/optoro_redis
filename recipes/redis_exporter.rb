include_recipe 'optoro_consul::client'

tar_extract 'https://s3.amazonaws.com/latest-container-assets/redis_exporter.tar.gz' do
  user 'root'
  group 'root'
  target_dir '/opt'
end

file '/opt/redis_exporter' do
  owner 'root'
  group 'root'
  mode '0755'
end

cookbook_file '/etc/init/redis_exporter.conf' do
  source 'redis_exporter.init'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

service 'redis_exporter' do
  action [:enable, :start]
  supports :restart => true
end

consul_definition 'redis-metrics' do
  type 'service'
  parameters(
    port: 9121,
    tags: [node['fqdn']],
    enableTagOverride: false,
    check: {
      interval: '10s',
      timeout: '5s',
      http: 'http://localhost:9121/metrics'
    }
  )
  notifies :reload, 'consul_service[consul]', :delayed
end
