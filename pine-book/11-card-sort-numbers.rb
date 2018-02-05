numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

def card_shuffle array
  array.sort!
  length = array.length

  2.times do
    left_index = 0
    right_index = length/2
    shuffled_array = []

    while shuffled_array.length < length
      if shuffled_array.length % 2 == 0
        shuffled_array.push(array[right_index])
        right_index += 1
      else
        shuffled_array.push(array[left_index])
        left_index+= 1
      end
    end

    array = shuffled_array
  end

  new_array = []
  cut = rand(length)
  index = 0

  while index < length
    new_array.push (array[(index + cut) % length])
    index += 1
  end

  new_array
end

puts card_shuffle numbers