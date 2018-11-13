# 4, 2, 7, 1, 3

# passthrough 1

# 4 2 7 1 3 | lowest: 4
# 4 2 7 1 3 | lowest: 2
# 4 2 7 1 3 | lowest: 2
# 4 2 7 1 3 | lowest: 1
# 4 2 7 1 3 | lowest: 1
# swap

# passthrough 2

# 1] 2 7 4 3 | lowest = 2
# 1] 2 7 4 3 | lowest = 2
# 1] 2 7 4 3 | lowest = 2
# 1] 2 7 4 3 | lowest = 2

# passthrough 3

# 1 2] 7 4 3 | lowest = 7
# 1 2] 7 4 3 | lowest = 4
# 1 2] 7 4 3 | lowest = 3
# swap

# passthrough 4
# 1 2 3] 4 7 | lowest = 4
# 1 2 3] 4 7 | lowest = 4

# compare values across the array and identify index of lowest value
# swap if lowest value is not at starting index
# increment starting index by one, and repeat process.

# selection sort requires max one 

def selection_sort!(array)
  starting_index = 0

  while starting_index <= array.length - 2 
  # one less because last passthrough is moot
    index_of_lowest = starting_index

    (starting_index + 1..array.length - 1).each do |index|
      if array[index] < array[index_of_lowest]
        index_of_lowest = index
      end
    end

    if index_of_lowest != starting_index
      array[index_of_lowest], array[starting_index] =
        array[starting_index], array[index_of_lowest]
    end
    starting_index += 1
  end
end

array = [4, 2, 7, 1, 3]

starting_time = Time.now
selection_sort!(array)
time_taken = Time.now - starting_time
p time_taken # 1.1e-05

array = (1..10_000).to_a.shuffle

starting_time = Time.now
selection_sort!(array)
time_taken = Time.now - starting_time
p time_taken # 4.2 seconds

array = (1..100_000).to_a.shuffle

starting_time = Time.now
selection_sort!(array)
time_taken = Time.now - starting_time
p time_taken # 439.089267 seconds