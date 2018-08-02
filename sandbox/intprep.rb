def halvsies(array)
  index = 0
  array.partition do |element|
    halfness = index <= array.size/2
    index += 1
    halfness
  end
end

p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
