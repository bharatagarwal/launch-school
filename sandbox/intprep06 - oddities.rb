def oddities(array)
  index = 1
  array.select do |char|
    oddness = index % 2 == 1
    index += 1
    oddness
  end
end

p oddities([2, 3, 4, 5, 6])
 # == [2, 4, 6]


