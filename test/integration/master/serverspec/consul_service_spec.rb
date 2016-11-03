require 'spec_helper'

describe 'Consul Service' do
  describe process('consul') do
    it { should be_running }
  end

  describe service('consul') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(8500) do
    it { should be_listening }
  end

  describe service('redis_exporter') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(9121) do
    it { should be_listening }
  end
end
