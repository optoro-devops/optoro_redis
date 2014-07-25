require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Redis Replication Client Daemon" do
  it "is listening on port 6380" do
    expect(port(6380)).to be_listening
  end

  it "is running" do
    expect(process("redis-server")).to be_running
  end
end
