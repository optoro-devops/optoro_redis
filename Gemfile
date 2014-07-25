source 'https://rubygems.org'

gem "chef", "~>11.8.0"
gem 'mixlib-shellout', "~>1.3.0"
gem 'berkshelf'

# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.5.2"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end
#
group :development, :test do
  gem 'chef-zero'
  gem 'guard-kitchen'
  gem 'test-kitchen'
  gem 'kitchen-docker'
  gem 'kitchen-vagrant'
end
