[1, 2, 3].select do |num|
  num > 5
  'hi' # truthy
end

# => [1,2,3]