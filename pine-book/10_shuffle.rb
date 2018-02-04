numbers = [1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10]
random_array = []

def random_sort array, random
  while array.length > 0
    rand_num = rand(array.length)
    random.push(array[rand_num])
    array.delete_at(rand_num)
  end
  random
end

print random_sort numbers, random_array
