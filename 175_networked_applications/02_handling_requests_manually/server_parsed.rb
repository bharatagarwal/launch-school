require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(request_line)
  http_method, path_and_params, http = request_line.split(' ')
  path, params = path_and_params.split('?')

  params = params.split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split('=')
    hash[key] = value
  end

  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  next if request_line.match(/favico/)
  
  http_method, path, params = parse_request(request_line)

  client.puts http_method
  client.puts path
  client.puts params
  
  params['rolls'].to_i.times do
    client.puts rand(params['sides'].to_i) + 1
  end

  client.close
end