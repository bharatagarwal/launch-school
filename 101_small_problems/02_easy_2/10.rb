array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each_with_index { |value, index| array2[index] = value }
# copying reference with shovel. another way is to use []=, this also copies reference
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2