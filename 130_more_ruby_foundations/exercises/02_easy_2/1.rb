def step(starting_value, ending_value, increment)
  value = starting_value                           # => 1
  return_array = []                                # => []

  while value <= ending_value  # => true, true, true, true, false
    yield(value)               # => nil, nil,    nil,       nil
    return_array << value      # => [1], [1, 4], [1, 4, 7], [1, 4, 7, 10]
    value += increment         # => 4,   7,      10,        13
  end                          # => nil

  return_array  # => [1, 4, 7, 10]
end             # => :step


step(1, 10, 3) { |value| puts "value = #{value}" }  # => [1, 4, 7, 10]

# >> value = 1
# >> value = 4
# >> value = 7
# >> value = 10