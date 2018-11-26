class SortableArray
  attr_reader :array

  def initialize array
    @array = array
  end

  def quicksort!(left_index, right_index)
    return if left_index >= right_index

    pivot_position = partition!(left_index, right_index)

    quicksort!(left_index, pivot_position - 1)
    quicksort!(pivot_position + 1, right_index)
  end


  def partition!(left_pointer, right_pointer)
    pivot_position = right_pointer
    pivot = array[pivot_position]

    right_pointer -= 1

    loop do
      while array[left_pointer] < pivot do
        left_pointer += 1
      end

      while array[right_pointer] > pivot do
        right_pointer -= 1
      end

      if left_pointer >= right_pointer
        break
      else
        swap(left_pointer, right_pointer)
      end
    end

    swap(left_pointer, pivot_position)
    
    puts
    p array

    left_pointer
  end


  def swap(first_pointer, second_pointer)
    array[first_pointer], array[second_pointer] =
     array[second_pointer], array[first_pointer]
  end
end

array = (0..10_000).to_a.shuffle
sortable_array = SortableArray.new(array)
time = Time.now
sortable_array.quicksort!(0, array.size - 1)
time_taken = Time.now - time
p time_taken

# >> 
# >> [5, 8, 2, 3, 4, 6, 0, 1, 7, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [5, 8, 2, 3, 4, 6, 0, 1, 7, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [5, 1, 2, 3, 4, 6, 0, 7, 8, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [0, 1, 2, 3, 4, 6, 5, 7, 8, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 14, 11, 15, 12, 13]
# >> 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 11, 13, 14, 15]
# >> 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# >> 
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# >> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
