require 'pry'

array = [1, 2, 3, 4, 5]

# --- start code here ---
def reduce(array, accumulator = nil)
  if accumulator!= nil
    index = 0
  else
    accumulator = array.first
    index = 1
  end

  while index < array.length
    accumulator = yield(accumulator, array[index])
    index += 1
  end

  accumulator
end

# --- end code here ---

reduce(array) { |acc, num| acc + num }
# => 15
reduce(array, 10) { |acc, num| acc + num }
# => 25
reduce(['a', 'b', 'c']) { |acc, value| acc += value }
# => "abc"
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
# => [1, 2, "a", "b"]