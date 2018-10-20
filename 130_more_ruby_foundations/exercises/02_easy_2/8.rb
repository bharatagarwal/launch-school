# The Enumberable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.

# return element for which block returns largest value.

# iterate over block using index = 0
# store array value and yield value
# return array value

def max_by(array)
  return nil if array.empty?

  max_yield = yield(array.first)
  max_value = array.first

  index = 1
  while index < array.size
    if yield(array[index]) > max_yield
      max_yield = yield(array[index])
      max_value = array[index]
    end
    index += 1
  end

  max_value
end


max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil