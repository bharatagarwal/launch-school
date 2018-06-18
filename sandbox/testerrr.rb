# After they became famous, the CodeBots all decided to move to a new building and live together. The building is represented by a rectangular matrix of room.

# Each cell in the matrix contains an integer that represents the price of the room. Some rooms are free (their cost is 0), but that's probably because they are haunted, so all the bots are afraid of them. That is why any room that is free or is located anywhere below a free room in the same column is not considered suitable for the bots to live in.

# Help the bots calculate the total price of all the rooms that are suitable for them

#          [[x, 1, 1, 2],
#           [x, 5, x, x],
#           [x, x, x, x]] => 9

# problem
# given a two dimensional array, look for rooms with cost 0.
# mark them as unusable, and also mark all rooms underneath as unusable.

# examples
# given

# data structures
# input: two dimensional array containing Integers
# modification: mark unusable rooms with x
# output: sum of all numbers in array whose value is not x.

# algorithms

# iterate over first line in array and identify 0s.
# mark 0s with x
# mark the values at same index with x until you hit the last line
# do this for all lines of the array

matrix = [[0, 1, 1, 2],
          [0, 5, 0, 0],
          [2, 0, 3, 3],
          [2, 0, 3, 3],]

puts "before: "
matrix.each do |value|
  p value.join(' ')
end

matrix.each_with_index do |rooms, outer_index|
  
  indices = []
  
  rooms.each_with_index do |room, inner_index|
    if room == 0
      matrix[outer_index][inner_index] = 'x'
      indices << inner_index
    end
  end

  indices.each do |index|
    lines = ((outer_index + 1)..(matrix.length - 1)).to_a
    lines.each do |line|
      matrix[line][index] = 'x'
    end
  end

end

puts "------"
puts "after: "

matrix.each do |value|
  p value.join(' ')
end