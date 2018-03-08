def execute(block) #gives error because there's no & next to block.
  block.call
end

execute { puts "Hello from inside the execute method!" }