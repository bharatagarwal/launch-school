
def reverse_append(array, number)
  return array if number < 0
  
  reverse_append array, number - 1
  array << number
  array
end


p reverse_append([], -1) # => []
p reverse_append([], 0) # => [0]
p reverse_append([], 1) # => [0, 1]
p reverse_append([], 2) # => [0, 1, 2]
p reverse_append([], 3) # => [0, 1, 2, 3]
