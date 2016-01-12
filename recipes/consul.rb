include_recipe 'optoro_consul::client'

params = {
  name: 'redis',
  port: 6379,
  address: node['fqdn'],
  checks: [
    {
      script: '/usr/local/bin/redis-cli PING',
      interval: '10s'
    }
  ]
}

file '/etc/consul.d/redis.json' do
  owner node['consul']['service_user']
  group node['consul']['service_group']
  content(JSON.pretty_generate('service' => params))
end

#session = create_session('redis')
#log session do
#  level :info
#end
