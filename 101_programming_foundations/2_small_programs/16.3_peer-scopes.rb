2.times do
  a = 'hi'
  puts a
end

loop do
  puts a # error because it's a peer block
  break
end

puts a # error because it's a peer block.