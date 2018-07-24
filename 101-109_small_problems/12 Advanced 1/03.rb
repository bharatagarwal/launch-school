def transpose(matrix)
  size = matrix.size
  new_matrix = []
  matrix.each_index do |index|
    new_matrix << (0..size-1).map { |n| matrix[n][index]}
  end

  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]