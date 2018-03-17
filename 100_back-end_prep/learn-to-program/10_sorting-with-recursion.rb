numbers = [5,7,2,1,9,11,9,12]

# starting with an empty array
sorted_array = []

def selection_sort(array, sorted)

  #finding smallest element
  while array.length > 0
    smallest = 0

    array.each_index do |i|
      if array[i] <= array[smallest]
        smallest = i
      end
    end

    #pushing smallest element to new array
    sorted.push(array[smallest])
    #removing smallest element from original array
    array.delete_at(smallest)

    #calling self recursively after reducing length of original array
    selection_sort(array, sorted)
  end

  sorted
end

puts selection_sort(numbers, sorted_array)