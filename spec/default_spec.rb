require 'spec_helper'

describe 'optoro_redis::default' do
  Resources::PLATFORMS.each do |platform, value|
    value['versions'].each do |version|
      context "On #{platform} #{version}" do
        include_context 'optoro_redis'

        let(:chef_run) do
          ChefSpec::SoloRunner.new(platform: platform, version: version, log_level: :error) do |node|
            node.set['lsb']['codename'] = value['codename']
          end.converge(described_recipe)
        end

        %w(
          redisio
          redisio::install
          redisio::enable
          optoro_metrics::redis
        ).each do |recipe|
          it 'includes #{recipe}' do
            expect(chef_run).to include_recipe(recipe)
          end
        end
      end
    end
  end
end
