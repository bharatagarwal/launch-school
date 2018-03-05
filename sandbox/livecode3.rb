# input_array = ["aba", "aa", "ad", "vcd", "aba"] 

input_array = ['a', 'aa', 'aba', 'acd', 'aaa', 'asc', 'a']

length_longest = 0

input_array.each do |string|
  if string.length > length_longest
      length_longest = string.length
  end
end

input_array = input_array.select do |string|
              string.length == length_longest
            end

puts input_array
