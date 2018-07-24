# problem
# sort the components/member/value in arrays in increasing order
# input: array of integers, or words
# output: the same kind, array of integers or words

# make pairs of the members of the array
# compare, if the first one is smaller, then swap.
# keep doing this for every pair, keep iterating until no swaps are happening inside the array

# algorithm
# make pairs via indexes
# 

# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

def bubble_sort!(array)
  # make pairs
  size = array.length
  
  
 loop do
   swap_count = 0
  (0..(array.length - 2)).each do |index|
    first, second = array[index..index+1]
    if array[index] > array[index + 1]
      array[index], array[index + 1] = array[index + 1], array[index]
      swap_count += 1
    end
  end
   break if swap_count == 0
 end
end

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)