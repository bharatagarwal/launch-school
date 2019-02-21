def run(some_code)
  some_code.call('papasthatopolous')
  some_code.call('sokratis')
end

code = lambda do |name|
  puts "Hey there, #{name}!" 
  break 'name' if name.include?('sokr')
end

# LocalJumpError if calling break on procs
# lambda breaks to execution content
# lambda returns to execution content, 
# while proc returns out


run(code) # => "name"

# >> Hey there, papasthatopolous!
# >> Hey there, sokratis!
