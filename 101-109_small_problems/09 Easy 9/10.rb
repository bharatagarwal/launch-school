def buy_fruit(array)

  new_array = []
  
  array.each do |sub_array|
    new_array << [sub_array.first] * sub_array.last
  end

  new_array.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
 # ==  ["apples", "apples", "apples", "orange", "bananas","bananas"]