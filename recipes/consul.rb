include_recipe 'optoro_consul::client'

consul_definition 'redis' do
  type 'service'
  parameters(
    port: 6379,
    tags: ['redis'],
    enableTagOverride: false,
    check: {
      interval: '10s',
      timeout: '5s',
      script: '/usr/local/bin/redis-cli ping'
    }
  )
  notifies :reload, 'consul_service[consul]', :delayed
end
