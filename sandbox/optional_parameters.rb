def greeting (name, options={})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name}, and I'm #{options[:age]} years old."
  end
end

puts greeting ("bob")
puts greeting("bob",{:age=>66})