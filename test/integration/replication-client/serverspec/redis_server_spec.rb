require 'spec_helper'

describe 'Redis Replication Client Daemon' do
  it 'is listening on port 6379' do
    expect(port(6379)).to be_listening
  end

  it 'is listening on port 6380' do
    expect(port(6380)).to be_listening
  end

  it 'is running' do
    expect(process('redis-server')).to be_running
  end

  describe file('/etc/redis/6380.conf') do
    it { should be_file }
    it { should contain 'slaveof 127.0.0.1 6379' }
  end
end
