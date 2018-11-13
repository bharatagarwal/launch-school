# 4, 2, 7, 1, 3

# passthrough 1
# |4 2| 7 1 3 swap
# 2 |4 7| 1 3 stay
# 2 4 |7 1| 3 swap
# 2 4 1 |7 3| swap

# passthrough 2
# |2 4| 1 3 [7 stay
# 2 |4 1| 3 [7 swap
# 2 1 |4 3| [7 swap

# passthrough 3
# |2 1| 3 [4 7 swap
# 1 |2 3| [4 7 stay

# passthrough 4
# |1 2| [3 4 7 stay

# compare first element with second, and if second is lower than first, swap.
# doing this 'bubbles' highest element to the end of array, second array to second-last and so on.

# keep passing through array until size comparison becomes only two elements

# data structures
# input: array

# algorithm
# ending_index = length - 1
# while ending_index > 0
# iterate from zero to ending_index
# (0..ending_index - 1).each do 
# if (index + 1) > (index) swap

def bubble_sort!(array)
  ending_index = array.size - 1
  sorted = false

  while ending_index > 0 && sorted == false
    sorted = true
    (0..ending_index - 1).each do |index|
      if array[index] > array[index + 1]
        sorted = false
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end

    ending_index -= 1
  end
end

array = [4, 2, 7, 1, 3]

starting_time = Time.now
bubble_sort!(array)
time_taken = Time.now - starting_time
p time_taken # 1.2 e-05

array = (1..10_0000).to_a.shuffle

starting_time = Time.now
bubble_sort!(array)
time_taken = Time.now - starting_time
p time_taken # "8.22 seconds"

