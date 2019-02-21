# client.rb

require 'socket'

host = '127.0.0.1'
port = '20000'

socket = TCPSocket.open(host, port) 

Thread.new do
  loop do
    data = socket.gets
    p data
  end
end

loop do
  data = gets
  socket.sendmsg data
end