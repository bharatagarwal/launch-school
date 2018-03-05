def execute(&block)
  block # since .call is not used, no output will be there. Instead, it will return a proc object
end

execute { puts "Hello from inside the execute method!" }