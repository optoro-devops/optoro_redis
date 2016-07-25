require 'spec_helper'

describe 'Redis Daemon' do
  it 'is listening on port 6379' do
    expect(port(6379)).to be_listening
  end

  it 'has a redis daemon running' do
    expect(process('redis-server')).to be_running
  end
end

describe command('redis-server --version') do
  its(:stdout) { should match(/Redis server v=3.2.1/) }
end
