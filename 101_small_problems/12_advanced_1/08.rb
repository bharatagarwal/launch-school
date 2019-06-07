# merge sort
# break down array into individual elements
# keep applying merge, because individual elements are already sorted.

def merge(first_array, second_array)
  return first_array if second_array.empty?
  return second_array if first_array.empty?

  merged_array = []
  first_index, second_index = 0, 0

  while first_index < first_array.length && second_index < second_array.length
    if first_array[first_index] <= second_array[second_index]
      merged_array << first_array[first_index]
      first_index += 1
    else
      merged_array << second_array[second_index]
      second_index += 1
    end

    if first_index == first_array.length
      merged_array << second_array[second_index .. -1]
    elsif second_index == second_array.length
      merged_array << first_array[first_index .. -1]
    end
  end

  merged_array.flatten
end

def merge_sort(array)
  return array if array.size == 1
  size = array.size

  first = array[0..size/2 - 1]
  second = array[size/2..-1]

  first = merge_sort(first)
  second = merge_sort(second)

  merge(first, second)
end

p merge_sort([6, 2, 7, 1, 4])
 # == [1, 2, 4, 6, 7]