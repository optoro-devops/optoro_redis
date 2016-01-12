require 'net/http'

def create_session(service_name)
  host = 'consul-001.optoro.io'
  path = '/v1/session/create'
  data = { "Name" => service_name }
  port = 8500
  http = Net::HTTP.new(host, port)
  response = http.send_request('PUT', path, data.to_json)
  JSON.parse(response.body)['ID']
end

def acquire_leader_session(service, session_id, data)
  host = 'consul-001.optoro.io'
  key = "service/#{service}/leader"
  path = "/v1/kv/#{key}?acquire=#{session_id}"
  body = data
  port = 8500
  http = Net::HTTP.new(host, port)
  response = http.send_request('PUT', path, body.to_json)
  response.body
end

def find_leader(service_name)
  host = 'consul-001.optoro.io'
  key = "service/#{service_name}/leader"
  path = "/v1/kv/#{key}"
  port = 8500
  http = Net::HTTP.new(host, port)
  response = http.send_request('GET', path)
  return nil if response.code == "404"
  JSON.parse(response.body)
end
