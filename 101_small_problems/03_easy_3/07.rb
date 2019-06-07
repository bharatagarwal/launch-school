# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# problem
# return odd numbered values of array.

# algorithm
# select array and reject a with counter defined outside select

def oddities(array)
  counter = 1
  array.select do |element|
    oddity = counter.odd?
    counter += 1
    oddity
  end
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []