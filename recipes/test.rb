node.force_override['consul']['service_mode'] = 'bootstrap' # ~FC019

package 'curl'

directory '/var/optoro' do
  action :create
  mode '0755'
end
