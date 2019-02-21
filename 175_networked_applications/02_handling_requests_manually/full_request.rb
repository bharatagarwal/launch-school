require 'socket'

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request = ''
  content_length = nil
  
  loop do
    line = client.gets
    request << line  

    if line.include?("Content-Length")
      content_length = line.split(": ")[1].to_i
      p content_length
    end
    
    if line == "\r\n" && request.include?("Content-Length")
      puts request
      puts client.readpartial(content_length)  
      break
    elsif line == "\r\n"
      puts request
      break
    end
  end

  client.puts "response"
  client.close
end