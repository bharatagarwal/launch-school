# Write a method that counts the number of occurrences of each element in a given array.

# problem
# input: array of strings
# output: hash with string value as key and number of occurances as value

# data structures
# obvious

# algorithm
# create a new hash which will count details
# iterate through array and add to count of key at each occurances.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

nums = [1, 1, 1, 79, 999, nil, false, {name: 'Bharat'}]

def count_occurrences(input_array)
  occurrences = {}

  input_array.each do |word|
    if occurrences.has_key?(word)
      occurrences[word] += 1
    else
      occurrences[word] = 1
    end
  end

  occurrences
end

puts count_occurrences(vehicles)
puts
puts count_occurrences(nums)