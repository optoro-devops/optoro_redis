include_recipe 'optoro_consul::client'

optoro_consul_service 'redis' do
  port 6379
  params node['optoro_consul']['service']
end
