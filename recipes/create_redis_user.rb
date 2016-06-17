user 'redis' do
  comment 'Redis service account'
  home node['redisio']['default_settings']['homedir']
  shell '/bin/false'
end

group 'redis' do
end
