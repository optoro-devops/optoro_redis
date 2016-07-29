include_recipe 'optoro_consul::client'

optoro_consul_service node['optoro_consul']['service_name'] do
  port 6379
  params node['optoro_consul']['service']
end
