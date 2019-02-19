require 'socket'

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept
  
  client.each_line do |line|
    puts line
  end  
  
  client.puts "response"
  client.close
end