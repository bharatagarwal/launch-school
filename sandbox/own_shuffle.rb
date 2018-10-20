require "pry"

def shuffle(array)
  new_array = []
  length = array.length

  while new_array.length < length
    new_array << array.sample
    array.delete_at(array.index(new_array.last))
  end

  new_array
end

array = (1..1500).to_a
p shuffle(array)