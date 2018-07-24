def transpose(matrix)
  column_size = matrix.size
  row_size = matrix.first.size
  new_matrix = []
  matrix.first.each_index do |row_index|
    new_matrix << (0...column_size).map { |column_index| matrix[column_index][row_index]}
  end

  new_matrix
end

def display_nested_array(nested_array)
  nested_array.each do |array|
    puts array.reduce(''){ |sum, char| sum + ' ' + char.to_s}
  end
end

matrix = [[3, 4, 1], [9, 7, 5]]
display_nested_array(transpose(matrix))
display_nested_array(transpose(transpose(matrix)))
display_nested_array(transpose(transpose(transpose(matrix))))


# p transpose([[1, 2, 3, 4]])
# p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]