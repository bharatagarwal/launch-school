# 8, 4, 2, 3

# passthrough 1
# 8, _, 2, 3 | temp 4; val < 8
# _, 8, 2, 3 | end of array
# 4, 8, 2, 3 | insert at beginning of array

# passthrough 2
# 4, 8, _, 3 | temp 2; val < 8
# 4, _, 8, 3 | temp 2; val < 3
# _, 4, 8, 3 | temp 2; beginning of array
# 2, 4, 8, 3 | insert at beginning

# passthrough 3 - last passthrough because gap at last point in array.
# 2, 4, 8, _ | temp 3; val < 8
# 2, 4, _, 8 | temp 3; val < 4
# 2, _, 4, 8 | temp 3l val > 2, insert at gap.
# 2, 3, 4, 8 | inserted and sorted

# -----------

# 4, 2, 7, 1, 3

# passthrough 1
# 4, _, 7, 1, 3 | temp 2 < 4
# _, 4, 7, 1, 3
# 2, 4, 7, 1, 3

# passthrough 2
# 2, 4, _, 1, 3 | temp 7 > 4, insert back at gap.
# 2, 4, 7, 1, 3

# passthrough 3
# 2, 4, 7, _, 3 | temp 1 < 7
# 2, 4, _, 7, 3 | temp 1 < 4
# 2, _, 4, 7, 3 | temp 1 < 2
# _, 2, 4, 7, 3 | beginning of array
# 1, 2, 4, 7, 3

# passthrough 4 - last passthrough
# 1, 2, 4, 7, _ | temp 3 < 7
# 1, 2, 4, _, 7 | temp 3 < 4
# 1, 2, _, 4, 7 | temp 3 > 2; insert at gap
# 1, 2, 3, 4, 7 | inserted and sorted.

# make incremental index at each passthrough - start at 1, and end at len - 1
# compare value at index with value to the left
# if it is less than value at left, move val at left to current index, and reduce current index by 1 -- til you reach zero index
# if value is equal or higher than value at left, put value back at index.

def insertion_sort!(array)
  insertion_index = 1

  while insertion_index < array.length
    position = insertion_index
    temp = array[insertion_index]

    while array[position - 1] > temp && position > 0
      array[position] = array[position - 1]
      array[position - 1] = nil
      position -= 1
    end

    array[position] = temp
    insertion_index += 1
  end
end

array = [4, 2, 7, 1, 3]
insertion_sort!(array)
array # => [1, 2, 3, 4, 7]

