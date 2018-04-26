numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # 1, 3
  numbers.shift(1) # remove the first of the array
end # => [3,4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number # 1, 2
  numbers.pop(1)
end

# => [1,2]