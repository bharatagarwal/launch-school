# input array                             -> [0, 5, 2, 1, 6, 3]
# paritioned array based on pivot 3 array -> [0, 1, 2, 3, 6, 5]

# algorithm
# randomly choose a pivot
# announce chosen pivot
# remove pivot from array by removing at index
# append to array, making it the last element.

# announce left pointer at index 0, and right pointer at index prior to pivot.

# compare left pointer with pivot, and keep moving left until pointer is greater than or equal to pivot.
# compare right pointer with pivot, and keep moving right until pointer is less than or equal to pivot.
# repeat process until left pointer is equal to or more than right pivot
# compare value of left pointer with pivot, and swap if pivot's value is lesser

class SortableArray
  def initialize(array)
    @array = array
  end

  def partition
    pivot = 6
    p @array
    puts "Pivot is #{pivot}"
    @array.delete_at(@array.index(pivot))
    @array.push(pivot)
    p @array

    left_pointer = 0
    right_pointer = @array.size - 2
    display_pointer(left_pointer)
    display_pointer(right_pointer)

    rounds = 0

    while rounds < 10

      index = left_pointer

      while index < right_pointer
        if @array[index] > pivot
          left_pointer = index
          break
        end
        index += 1
      end

      index = right_pointer

      puts "moving right pointer"
      while index > left_pointer
        if @array[index] <= pivot
          p index
          right_pointer = index
          break
        end
        index -= 1
      end
      
      rounds += 1
      
      puts "After round #{rounds}:"
      p @array
      display_pointer(left_pointer)
      display_pointer(right_pointer)

      temp = @array[left_pointer]
      @array[left_pointer] = @array[right_pointer]
      @array[right_pointer] = temp

      puts "After swap:"
      p @array
      display_pointer(left_pointer)
      display_pointer(right_pointer)

      break if left_pointer >= right_pointer
    end
  end

  def display_pointer(pointer)
    dis = ([' '] + ['   ']*(pointer) + ['^'])
    puts dis.join('')
  end
end

array = (0..9).to_a.shuffle
SortableArray.new(array).partition

# >> [8, 0, 1, 7, 9, 2, 4, 3, 6, 5]
# >> Pivot is 6
# >> [8, 0, 1, 7, 9, 2, 4, 3, 5, 6]
# >>  ^
# >>                          ^
# >> moving right pointer
# >> 8
# >> After round 1:
# >> [8, 0, 1, 7, 9, 2, 4, 3, 5, 6]
# >>  ^
# >>                          ^
# >> After swap:
# >> [5, 0, 1, 7, 9, 2, 4, 3, 8, 6]
# >>  ^
# >>                          ^
# >> moving right pointer
# >> 7
# >> After round 2:
# >> [5, 0, 1, 7, 9, 2, 4, 3, 8, 6]
# >>           ^
# >>                       ^
# >> After swap:
# >> [5, 0, 1, 3, 9, 2, 4, 7, 8, 6]
# >>           ^
# >>                       ^
# >> moving right pointer
# >> 6
# >> After round 3:
# >> [5, 0, 1, 3, 9, 2, 4, 7, 8, 6]
# >>              ^
# >>                    ^
# >> After swap:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                    ^
# >> moving right pointer
# >> 5
# >> After round 4:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> After swap:
# >> [5, 0, 1, 3, 2, 4, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> moving right pointer
# >> 5
# >> After round 5:
# >> [5, 0, 1, 3, 2, 4, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> After swap:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> moving right pointer
# >> 5
# >> After round 6:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> After swap:
# >> [5, 0, 1, 3, 2, 4, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> moving right pointer
# >> 5
# >> After round 7:
# >> [5, 0, 1, 3, 2, 4, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> After swap:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> moving right pointer
# >> 5
# >> After round 8:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> After swap:
# >> [5, 0, 1, 3, 2, 4, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> moving right pointer
# >> 5
# >> After round 9:
# >> [5, 0, 1, 3, 2, 4, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> After swap:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> moving right pointer
# >> 5
# >> After round 10:
# >> [5, 0, 1, 3, 4, 2, 9, 7, 8, 6]
# >>              ^
# >>                 ^
# >> After swap:
# >> [5, 0, 1, 3, 2, 4, 9, 7, 8, 6]
# >>              ^
# >>                 ^