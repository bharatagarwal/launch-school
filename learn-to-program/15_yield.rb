def do_it_twice(&block)
  block.call
  block.call
end

do_it_twice do 
  puts "Hello."
end

def do_it_thrice
  yield
  yield
  yield
end

do_it_thrice do 
  puts "There."
end
