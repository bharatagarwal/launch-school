# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there article two same numbers
#   then that number can be used 2 times.
# =end

# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

# find maximum number
# 

input = [5, 3, 7, 9, 2, 51, 90]


# 1. find the maximum value in the input
# 2. start by multiplying first value (5)
    # with each of the rema


    =begin
1. Form all possible subsets of 3
    example:  [1, 2, 3, 4, 5, 6]
    -------------------------
    pair 1:   [1, 2, 3      ]
    pair 2:   [1, 2,    4   ]
    pair 3:   [1, 2,       5]
    pair 4:   [1,    3, 4   ]
    pair 5:   [1,    3,    5]
   We want to run 3 loops to iterate through all the possible numbers for each of our 3 numbers to be included in subsets
2. For each, check whether their product is equal to the maximum element within the array, if this proves true, stop method and return true
3. If we go through all subsets without 2. evaluating true, return false
=end

def mult_of_three_nums(arr)
  size = arr.size
  (0..size - 3).each do |idx1|
    ((idx1 + 1)..(size - 2)).each do |idx2|
      ((idx2 + 1)..(size - 1)).each do |idx3|
        # binding.pry
        product = arr[idx1] * arr[idx2] * arr[idx3]
        return true if product == arr.max
      end
    end
  end
  false
end

p mult_of_three_nums([1,2,3,4,5,6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

def mult_of_three_nums(arr)
  arr.combination(3).to_a.each do |subbar|
    return true if subarr.reduce(:*) == arr.max
  end
  false
end