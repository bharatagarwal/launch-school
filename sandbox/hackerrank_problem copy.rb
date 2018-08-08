# Given an array of integers, can you sort an array in ascending order using only one of the following operations one time?

# Swap two elements.
# Reverse one segment.

# If either one would work, choose swap over reverse. For instance, given an array [2, 3, 5, 4] we can swap the 4 and 5, or reverse them. We choose swap.

# problem

# input: array of integers of given size
# sort numbers in ascending order
# segment of size 2 or more
# indexes go from 1 to size inclusive
# size between 2 and 100,000
# array value between 0 and 1,000,000
# all array values distinct

# output:
# check if all values sorted ascending, then output yes
# if array can be sorted using single operation, return yes
  # if array can be sorted by swapping two numbers at indices l and r, then output "swap l r"
  # else if reverse d[l..r] reverse leads to array being sorted then output "reverse "
# else if array cannot be sorted by either method, return "false"

# data structures
# input: size in form of string, and array separated by spaces
# input: convert size to integer, and split array string by space, and convert each to integer.
# checking for swappable and reversible to return booleans
# create separate methods to return indices where this will happen.
# use zero index, just increment value of l and r by 1 for output.

# algorithm
# check if array is sorted
# if array is not sorted, then check whether swapping two values would make it sorted. 
# compare sorted array with original array, and if two elements are mismatching, swap.
# to check whether reversing a segment would sort the array
# check all possible sub-segments and see if reversing them would make resultant array sorted.
# if neither swappable nor reversible, then return no.


def parse_array(array)
  array.split(' ').map(&:to_i)
end

def swappable?(array)
  sorted_array = array.sort

  count = 0
  sorted_array.each_with_index do |val, index|
    if val != array[index]
      count += 1
    end
  end

  if count != 2
    false
  else
    true
  end
end

def indices_to_swap(array)
  sorted_array = array.sort
  indices = []

  sorted_array.each_with_index do |val, index|
    if val != array[index]
      indices << index
    end
  end

  l, r = indices.min, indices.max
  [l, r]
end

def reversible?(array)
    l = 0
    loop do
      
      r = 1
      loop do
        if l == 0 && array.sort == array[l..r].reverse + array[r + 1..-1]
            return true
        elsif r == array.size - 1 && array.sort == array[0..l - 1] + array[l..r].reverse
            return true
        elsif array.sort == array[0..(l - 1)] + array[l..r].reverse + array[r + 1..- 1]
          return true
          break
        end

        r += 1
        break if r == array.size
      end
      
      l += 1
      break if l == array.size - 1
    end

  false
end

def indices_to_reverse(array)
    l = 0
    loop do
      
      r = 1
      loop do
        # puts "array segment:"
        # p array[l..r]
        if l == 0 && array.sort == array[l..r].reverse + array[r + 1..-1]
          # p 'yes'
          return [l, r]
        elsif r == array.size - 1 && array.sort == array[0..l - 1] + array[l..r].reverse
          # p 'yes'
          return [l, r]
        elsif array.sort == array[0..(l - 1)] + array[l..r].reverse + array[r + 1..- 1]
          # p 'yes'
          return [l, r]
        end

        # p 'no'
        r += 1
        break if r == array.size
      end
      
      l += 1
      break if l == array.size - 1
    end
  nil
end

def almost_sorted(count, array)
  return 'array too short' if count < 2
  numeric_array = parse_array(array)
  if numeric_array == numeric_array.sort
    return 'yes'
  elsif swappable?(numeric_array)
    indices = indices_to_swap(numeric_array)
    return 'yes' + "\n" + 'swap ' + "#{indices.first + 1} #{indices.last + 1}"
  elsif reversible?(numeric_array)
    indices = indices_to_reverse(numeric_array)
    return 'yes' + "\n" + 'reverse ' + "#{indices.first + 1} #{indices.last + 1}"
  else
    return 'no'
  end
end

count = gets.to_i
array = gets
puts almost_sorted(count, array)