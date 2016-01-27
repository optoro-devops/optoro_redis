require 'spec_helper'

describe 'optoro_redis::add_aws_volume' do
  Resources::PLATFORMS.each do |platform, value|
    value['versions'].each do |version|
      context "On #{platform} #{version}" do
        include_context 'optoro_redis'

        before do
          stub_command('mountpoint /var/optoro/redis').and_return(false)
        end

        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: :error) do |node|
            node.set['lsb']['codename'] = value['codename']
          end.converge(described_recipe)
        end

        it 'includes aws recipe' do
          expect(chef_run).to include_recipe('aws')
        end
      end
    end
  end
end
