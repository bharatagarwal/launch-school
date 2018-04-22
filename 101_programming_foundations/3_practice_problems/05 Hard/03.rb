def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

# non-mutating because re-assignment

def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

# non-mutating because re-assignment

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

# mutating 

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# mess_with_vars1 one, two, three
# mess_with_vars2 one, two, three
# mess_with_vars3 two, three, one