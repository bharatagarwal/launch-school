# server.rb

require 'socket'

port = 20000

server = TCPServer.new(port)
socket = server.accept

Thread.new do
  loop do
    data = socket.gets
    p data
  end 
end 

loop do
  data = gets
  socket.print(data)
end