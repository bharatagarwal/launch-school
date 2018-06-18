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

# algorithm
# iterate over first line in array and identify 0s.
# mark 0s with x
# mark the values at same index with x until you hit the last line
# do this for all lines of the array
# return total at the end of the array.

matrix = [[0, 1, 1, 9],
          [1, 5, 0, 2],
          [2, 0, 9, 0],]

def display_matrix(array)
  array.each do |value|
    p value.join(' ')
  end
end

puts "before: "
display_matrix(matrix)

matrix.each_with_index do |rooms, line|
  
  index = 0
  rooms.map! do |room|
    if room == 0
      lines_under = ((line + 1)..(matrix.size - 1))
      lines_under.each do |line_under|
        matrix[line_under][index] = 'x'
      end

      index += 1
      room = 'x'
    else
      index += 1
      room
    end
  end

end

puts
puts "after: " 

display_matrix(matrix)

total = matrix.flatten.reduce(0) do |sum, value|
          if value != 'x'
            sum + value
          else
            sum
          end
        end

puts "\nTotal is #{total}."